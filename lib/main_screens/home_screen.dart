import 'package:best_friend/main_screens/main_community.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/main_screens/login.dart';
import 'package:best_friend/main_screens/main_convenience.dart';
import 'package:best_friend/main_screens/main_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String imageUrl =
      'https://lh3.googleusercontent.com/u/0/drive-viewer/AFGJ81oPOO1KRCND3vAnBoUuOeYrwGeYHTMrn1-_Ei7TLkhQMcKKvidbGXAmEFtNNpztOdTz3K2ZBvG1f7p317aDMpSVbsyDSg=w2940-h1618';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
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
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text(
                    '환영합니다',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Button(
                    pagelink: CommunityScreen(),
                    pagename: '커뮤니티',
                  ),
                  const Button(
                    pagelink: ConvenienceScreen(),
                    pagename: '편의',
                  ),
                  const Button(
                    pagelink: MapScreen(),
                    pagename: '지도',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String pagename;
  final Widget pagelink;

  const Button({
    super.key,
    required this.pagelink,
    required this.pagename,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          height: 65,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      pagelink,
                ),
              );
            },
            child: Text(
              pagename,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}