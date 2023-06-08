import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final double sizeOfBox;
  final String category;
  final ValueChanged<String> onChanged;

  const Input({
    super.key,
    this.sizeOfBox = 130,
    required this.category,
    required this.onChanged,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.category,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 70,
          ),
          // TexField 를 클래스로 만들 것.
          SizedBox(
            width: widget.sizeOfBox,
            child: TextField(
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                labelText: '${widget.category}를 입력하세요',
                hintText: ':',
              ),
            ),
          ),
          //BFInputField(nameInputField: '나이를 입력하세요'),
        ]);
  }
}
