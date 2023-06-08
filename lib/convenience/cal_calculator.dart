import 'package:flutter/material.dart';
import 'package:best_friend/convenience/recommended_calories.dart';

class CalCalculator extends StatelessWidget {
  const CalCalculator({super.key});

  onPressed() {}

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
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Column(children: [
          const Text(
            '오늘 먹은 음식',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: 450,
            height: 30,
            color: const Color.fromARGB(255, 244, 247, 140),
          ),
          const SizedBox(height: 450),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '전체 칼로리: ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(
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
          Container(
            height: 70,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
