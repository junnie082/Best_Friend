import 'package:flutter/material.dart';
import 'package:best_friend/appBar/BFAppBar.dart';
import 'package:best_friend/convenience/BMI.dart';
import 'package:best_friend/convenience/cal_calculator.dart';

class ConvenienceScreen extends StatelessWidget {
  const ConvenienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BFAppBar(
          appBarFunction: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 250),
          child: Column(
            children: [
              SizedBox(
                width: 500, // Adjust the width as desired
                height: 50, // Adjust the height as desired
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BMI(),
                      ),
                    );
                  },
                  child: const Text(
                    'BMI 계산기',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 500, // Adjust the width as desired
                height: 50, // Adjust the height as desired
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalCalculator(),
                      ),
                    );
                  },
                  child: const Text(
                    '칼로리 계산기',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
