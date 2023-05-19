import 'package:flutter/material.dart';
import 'package:best_friend/buttons/style_elevated_button.dart';
import 'package:best_friend/community/information.dart';

class BFToggleButtonKindDisabled extends StatefulWidget {
  const BFToggleButtonKindDisabled({super.key});

  @override
  _BFToggleButtonState createState() => _BFToggleButtonState();
}

class _BFToggleButtonState extends State<BFToggleButtonKindDisabled> {
  final List<bool> _isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ToggleButtons(
          isSelected: _isSelected,
          borderColor: Colors.transparent,
          onPressed: (index) {
            setState(() {
              _isSelected[index] = !_isSelected[index];
              if (index == 0) {
                _isSelected[index + 1] = !_isSelected[index];
                _isSelected[index + 2] = !_isSelected[index];
              } else if (index == 1) {
                _isSelected[index - 1] = !_isSelected[index];
                _isSelected[index + 1] = !_isSelected[index];
              } else {
                _isSelected[index - 2] = !_isSelected[index];
                _isSelected[index - 1] = !_isSelected[index];
              }
              // Handle button press event here
            });
          },
          children: const [
            StyleOfElevatedButton(
                detailedScreen: Information(),
                text: '전체',
                round: 50,
                bgColor: Colors.lightGreen,
                textColor: Colors.black,
                size: 11),
            StyleOfElevatedButton(
                detailedScreen: Information(),
                text: '신체',
                round: 50,
                bgColor: Colors.grey,
                textColor: Colors.black,
                size: 12),
            StyleOfElevatedButton(
                detailedScreen: Information(),
                text: '정신',
                round: 50,
                bgColor: Colors.grey,
                textColor: Colors.black,
                size: 12),
          ],
        ),
      ],
    );
  }
}
