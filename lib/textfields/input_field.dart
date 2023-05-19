import 'package:flutter/material.dart';

class BFInputField extends StatefulWidget {
  final String nameInputField;
  const BFInputField({super.key, required this.nameInputField});

  @override
  State<BFInputField> createState() => _BFInputFieldState();
}

class _BFInputFieldState extends State<BFInputField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: widget.nameInputField,
        labelText: 'Input Field',
      ),
    );
  }
}
