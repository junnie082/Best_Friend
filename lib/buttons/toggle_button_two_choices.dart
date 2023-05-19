import 'package:best_friend/community/information.dart';
import 'package:best_friend/main_screens/main_community.dart';
import 'package:flutter/material.dart';

class BFToggleButton extends StatefulWidget {
  final String text1, text2;
  const BFToggleButton({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  _BFToggleButtonState createState() => _BFToggleButtonState();
}

class _BFToggleButtonState extends State<BFToggleButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 55,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const CommunityScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              widget.text1,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 55,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });

              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Information(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              widget.text2,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
