import 'package:flutter/material.dart';

class StyleOfElevatedButton extends StatelessWidget {
  final String text;
  final double round, size;
  final Color bgColor, textColor;
  final Widget detailedScreen;

  const StyleOfElevatedButton({
    super.key,
    required this.text,
    required this.round,
    required this.bgColor,
    required this.textColor,
    required this.size,
    required this.detailedScreen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                detailedScreen,
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: size, fontWeight: FontWeight.bold),
      ),
    );
  }
}
