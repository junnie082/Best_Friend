import 'package:flutter/material.dart';

class RecommendedCalories extends StatelessWidget {
  const RecommendedCalories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              '하루 권장 칼로리',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            actions: const []),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '여성',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 30),
              Text(
                '만 19~30세   1,600~2,000kcal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                '만 30~50세   1,800~2,000kcal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                '만 50세 이상   1,600kcal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 100),
              Text(
                '남성',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 30),
              Text(
                '만 19~30세   2,000~2,400kcal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                '만 30~50세   2,200~3,000kcal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                '만 50세 이상   2,000~2,600kcal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
