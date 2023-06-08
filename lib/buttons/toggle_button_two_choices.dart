import 'package:best_friend/community/information.dart';
import 'package:best_friend/main_screens/main_community.dart';
import 'package:flutter/material.dart';

class BFToggleButton extends StatefulWidget {
  final String text1, text2;
  // where 이 0 이면 커뮤니티, 1 이면 BMI
  final double where;
  const BFToggleButton(
      {Key? key, required this.text1, required this.text2, required this.where})
      : super(key: key);

  @override
  _BFToggleButtonState createState() => _BFToggleButtonState();
}

class _BFToggleButtonState extends State<BFToggleButton> {
  // '정보' 버튼을 눌러도 버튼 색이 변하지 않는 문제가 있었는데,
  // static 으로 바꾸니 해결.
  static int _selectedIndex = 0;

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
              if (widget.where == 0) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const CommunityScreen(),
                  ),
                );
              }
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
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: _selectedIndex == 0 ? Colors.white : Colors.black,
              ),
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
              if (widget.where == 0) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Information(),
                  ),
                );
              }
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
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: _selectedIndex == 1 ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
