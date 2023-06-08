import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final double sizeOfBox;
  final String category;
  const Input({super.key, this.sizeOfBox = 130, required this.category});

  // 이 함수에서 입력된 값을 handling 함.
  void textChanged(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          category,
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 70,
        ),
        // TextField 를 클래스로 만들 것.
        SizedBox(
          width: sizeOfBox,
          child: TextField(
            onChanged: textChanged,
            decoration: InputDecoration(
              labelText: '$category를 입력하세요',
            ),
          ),
        ),
        //BFInputField(nameInputField: '나이를 입력하세요'),
      ],
    );
  }
}
