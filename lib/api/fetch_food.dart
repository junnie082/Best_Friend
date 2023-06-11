import 'package:best_friend/api/data_of_foods.dart';
import 'package:best_friend/api/food_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class Foods extends StatefulWidget {
  final String link, queryString;

  const Foods({super.key, required this.link, required this.queryString});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  List<Food> foods = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }

  Future<void> getWebsiteData() async {
    final url = Uri.parse(widget.link);
    final response = await http.get(url);
    final document = parser.parse(response.body);

    final foodElements = document.querySelectorAll(widget.queryString);
    final foodNames =
        foodElements.map((element) => element.text.trim()).toList();

    final calories = foodElements
        .map((element) => element.parent?.parent
            ?.querySelectorAll('td')
            .map((tdElement) => tdElement.text.trim())
            .where((calorie) => calorie.contains('kcal'))
            .map((calorie) =>
                int.tryParse(calorie.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0)
            .toList())
        .toList();

    print('foodNames ${foodNames}');
    print('calories ${calories}');

    print('Count: ${foodNames.length}');
    print('Count: ${calories.length}');

    setState(() {
      foods = List.generate(
        foodNames.length,
        (index) => Food(
          url: '',
          calories: calories.length > index ? calories[index].toString() : '',
          foodName: foodNames.length > index ? foodNames[index] : '',
        ),
      );

      DataOfFoods.listFoods = foods;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 150,
  //     child: ListView.separated(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: foods.length,
  //         separatorBuilder: (context, index) {
  //           return const SizedBox(
  //             width: 15,
  //           );
  //         },
  //         itemBuilder: (context, index) {
  //           final food = foods[index];
  //           return GestureDetector(
  //             onTap: () => launchUrl(Uri.parse(foods[index].url)),
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //               child: Container(
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(10),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.grey.withOpacity(0.5),
  //                       spreadRadius: 2,
  //                       blurRadius: 10,
  //                       offset: const Offset(0, 3),
  //                     ),
  //                   ],
  //                 ),
  //                 width: 150,
  //                 child: ListTile(
  //                   title: Text(
  //                     foods[index].foodName,
  //                     style: const TextStyle(
  //                         fontSize: 15, fontWeight: FontWeight.bold),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }
}
