import 'package:best_friend/buttons/toggle_button_two_choices.dart';
import 'package:best_friend/textfields/input.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double? age = 0, weight = 0, height = 0;
  double result = double.nan, lowweight = 0, highweight = 0;
  String bmitext = '';

  void onPressed() {
    setState(() {
      result = (weight! / ((0.01 * height!) * (0.01 * height!)));
      result = double.parse(result.toStringAsFixed(1));
      lowweight = (18.5 * (0.01 * height!) * (0.01 * height!)) - weight!;
      highweight = weight! - (23 * (0.01 * height!) * (0.01 * height!));
      lowweight = double.parse(lowweight.toStringAsFixed(1));
      highweight = double.parse(highweight.toStringAsFixed(1));

      if (result < 18.5) {
        bmitext = '당신은 저체중입니다.\n$lowweight kg 만큼 증량해야 정상 체중 입니다.';
      } else if (result >= 18.5 && result < 23) {
        bmitext = '당신은 정상입니다.';
      } else if (result >= 23 && result < 25) {
        bmitext = '당신은 과체중입니다.\n$highweight kg 만큼 감량해야 정상 체중 입니다.';
      } else {
        bmitext = '당신은 비만입니다.\n$highweight kg 만큼 감량해야 정상 체중 입니다.';
      }
    });
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Input(
                category: '나이',
                onChanged: (value) {
                  setState(() {
                    if (value != "") age = double.parse(value);
                  });
                },
              ),
              const SizedBox(height: 30),
              Input(
                category: '체중',
                onChanged: (value) {
                  setState(() {
                    if (value != "") weight = double.parse(value);
                  });
                },
              ),
              const SizedBox(height: 30),
              Input(
                category: '신장',
                onChanged: (value) {
                  setState(() {
                    if (value != "") height = double.parse(value);
                  });
                },
              ),
              const SizedBox(height: 50),
              // 성별 토글.
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                padding: EdgeInsets.all(20),
                child: Text(
                  '내 BMI 지수는',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              // 나중에 여기에 계산된 BMI 지수가 나타남.
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFFC3DAEF),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (result.isNaN ? '숫자를 입력해주세요' : '$result'),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // 과제중/저체중/ ... 어떤 상태에 해당하는지 출력해 주어야 함.
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: const Text("계산하기"),
              ),
              const SizedBox(height: 30),
              // 정상 체중 보다 적게 나가면 '증량' 해야 합니다.
              // 정상 체중 보다 많이 나가면 '감량' 해야 합니다.
              Center(
                child: Text(
                  bmitext,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
      ),
    );
  }
}
