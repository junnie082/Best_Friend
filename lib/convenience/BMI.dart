import 'package:best_friend/buttons/toggle_button_two_choices.dart';
import 'package:best_friend/textfields/input.dart';
import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI 계산기',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Input(
                category: '나이',
              ),
              const SizedBox(height: 30),
              const Input(
                category: '체중',
              ),
              const SizedBox(height: 30),
              const Input(
                category: '신장',
              ),
              const SizedBox(height: 50),
              // 성별 토글.
              const Row(
                children: [
                  Text(
                    '성별',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  BFToggleButton(where: 1, text1: '남', text2: '여'),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  '내 BMI 지수는',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              // 나중에 여기에 계산된 BMI 지수가 나타남.
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color(0xFFC3DAEF),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(height: 30),
              // 과제중/저체중/ ... 어떤 상태에 해당하는지 출력해 주어야 함.
              const Text('입니다',
                  style: TextStyle(fontSize: 30, color: Colors.black)),
              const SizedBox(height: 30),
              // 정상 체중 보다 적게 나가면 '증량' 해야 합니다.
              // 정상 체중 보다 많이 나가면 '감량' 해야 합니다.
              const Center(
                child: Text(
                  '정상 체중이 되려면 \$kg 만큼을 감량해야 합니다',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
