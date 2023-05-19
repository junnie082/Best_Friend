import 'package:best_friend/main_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/main_screens/main_community.dart';
import 'package:best_friend/main_screens/main_convenience.dart';
import 'package:best_friend/main_screens/main_map.dart';

class BFAppBar extends StatelessWidget implements PreferredSizeWidget {
  // appBarFunction 이 1 이면 현재 화면이 커뮤니티 화면
  // appBarFunction 이 2 이면 현재 화면이 편의 화면
  // appBarFunction 이 3 이면 현재 화면이 지도 화면
  final int appBarFunction;
  const BFAppBar({super.key, required this.appBarFunction});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (appBarFunction != 1) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const CommunityScreen(),
                    ),
                  );
                }
              },
              child: const Text(
                '커뮤니티',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ConvenienceScreen(),
                  ),
                );
              },
              child: const Text(
                '편의',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MapScreen(),
                  ),
                );
              },
              child: const Text(
                '지도',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AuthPage(),
                  ),
                );
              },
              child: const Text(
                '로그아웃',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
