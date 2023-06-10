import 'package:flutter/material.dart';
import 'package:best_friend/convenience/recommended_calories.dart';

class CalCalculator extends StatelessWidget {
  const CalCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            '칼로리 계산기',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: const []),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        labelText: "오늘 먹은 음식을 검색하세요",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(),
                  )
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    '전체 칼로리: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: Row(
          children: [
            Container(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecommendedCalories(),
                    ),
                  );
                },
                child: const Text(
                  '하루 권장 칼로리',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
