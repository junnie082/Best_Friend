import 'package:best_friend/api/data_of_foods.dart';
import 'package:best_friend/api/food_model.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/convenience/recommended_calories.dart';

class CalCalculator extends StatefulWidget {
  const CalCalculator({Key? key}) : super(key: key);

  @override
  State<CalCalculator> createState() => _CalCalculatorState();
}

class _CalCalculatorState extends State<CalCalculator> {
  String _searchText = "";
  final List<Food> dataList = DataOfFoods.listFoods;
  List<Food> filteredList = [];
  List<Food> selectedFoods = []; // 선택된 음식을 저장하는 리스트

  int totalCal = 0;

  void _filterList() {
    filteredList = dataList
        .where((food) =>
            food.foodName.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
    print(filteredList);
  }

  void _resetTotalCalories() {
    setState(() {
      totalCal = 0;
      selectedFoods.clear();
    });
  }

  void _addFood(Food food) {
    setState(() {
      selectedFoods.add(food);
      totalCal +=
          int.parse(food.calories.replaceAll('[', '').replaceAll(']', ''));
      filteredList.remove(food); // 선택한 음식은 검색 결과 리스트에서 제거
    });
  }

  void _removeFood(Food food) {
    setState(() {
      selectedFoods.remove(food);
      totalCal -=
          int.parse(food.calories.replaceAll('[', '').replaceAll(']', ''));
      filteredList.add(food); // 삭제한 음식은 검색 결과 리스트에 다시 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '칼로리 계산기',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                    _filterList();
                  });
                },
                decoration: const InputDecoration(
                  labelText: "오늘 먹은 음식을 검색하세요",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '전체 칼로리: $totalCal kcal',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: _resetTotalCalories,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // 텍스트 색상 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 둥근 모서리 설정
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  '초기화',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (selectedFoods.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '오늘 먹은 음식',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: selectedFoods.length,
                  itemBuilder: (context, index) {
                    final food = selectedFoods[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(8),
                      color: Colors.yellow, // 선택한 음식의 박스 배경색을 노란색으로 설정
                      child: ListTile(
                        title: Text(
                          '${index + 1}. ${food.foodName}    ${food.calories} kcal',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeFood(food),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            if (_searchText.isNotEmpty) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '검색 결과...',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final food = filteredList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          '${index + 1}. ${food.foodName}    ${food.calories} kcal',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _addFood(food),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
