import 'package:flutter/material.dart';
import 'package:best_friend/community/all_categories.dart';
import 'package:best_friend/community/FAQs.dart';
import 'package:best_friend/community/information.dart';
import 'package:best_friend/main_screens/main_community.dart';

class BFToggleButtonCategories extends StatefulWidget {
  const BFToggleButtonCategories({Key? key}) : super(key: key);

  @override
  _BFToggleButtonState createState() => _BFToggleButtonState();
}

class _BFToggleButtonState extends State<BFToggleButtonCategories> {
  // 누르는 버튼이 초록색이고 나머지 버튼이 회색임을 유지하고 싶다면 _selectedIndex 앞에 static 을 붙여라!
  static int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ToggleButtons(
          isSelected: [
            _selectedIndex == 0,
            _selectedIndex == 1,
            _selectedIndex == 2,
            _selectedIndex == 3,
          ],
          borderColor: Colors.transparent,
          onPressed: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedIndex == 0 ? Colors.lightGreen : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AllCategories(),
                  ),
                );
              },
              child: const Text(
                '전체',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedIndex == 1 ? Colors.lightGreen : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const CommunityScreen(),
                  ),
                );
              },
              child: const Text(
                '자유',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedIndex == 2 ? Colors.lightGreen : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Information(),
                  ),
                );
              },
              child: const Text(
                '정보',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedIndex == 3 ? Colors.lightGreen : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const FAQs(),
                  ),
                );
              },
              child: const Text(
                'FAQs',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
