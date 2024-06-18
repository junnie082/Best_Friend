import 'package:best_friend/appBar/BFAppBar.dart';
import 'package:best_friend/buttons/style_elevated_button.dart';
import 'package:best_friend/buttons/toggle_button_kinds_of_disabled.dart';
import 'package:best_friend/community/post.dart';
import 'package:best_friend/search/search.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/api/fetch_articles.dart';

import '../community/readpage.dart';

// <web scraping> https://www.youtube.com/watch?v=9ZfRE_DN9a0

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
// ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 의 정렬 방식에 대한 논의 필요
      appBar: const BFAppBar(
        appBarFunction: 1,
      ), // 여기서 에러 있었는데 gpt 가 고쳐줌.
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Search()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                ),
                child: const SizedBox(
                  width: 500,
                  height: 40,
                  child: Center(
                    child: Text(
                      '검색',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            // 뉴스 기사(복지 정보)
            const Articles(
              link: "http://www.mapowelfare.or.kr/bbs/board.php?bo_table=0301",
              queryString: 'td.td_subject.text-left > a',
            ),
            const SizedBox(
              height: 2,
            ),

            const Row(
              children: [
                // 자유 버튼
                BFToggleButtonCategories(),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 70,
                  height: 35,
                  child: StyleOfElevatedButton(
                      detailedScreen: Post(),
                      text: '글쓰기',
                      round: 0,
                      bgColor: Color(0xFFEFC6EB),
                      textColor: Colors.black,
                      size: 12),
                ),
              ],
            ),

            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "정보 | 마포보장구수리센터    ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                //Text("정보 | 마포보장구수리센터    ")),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "질문 | 이럴땐 어떻게 하나요?    ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "질문 | 저희 아이가 장애가 있습니다. 혹시..    ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "자유 | 저는 차별받을 때 이렇게 행동합니다   ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "자유 | 여러분들 정부에서 장애인을 도와주는 제도..",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "정보 | 권익 옹호 기관별 업무 및 연락처 안내  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "정보 | 마포구 내 사회복지시설 안내  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadPage()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "질문 | 저희 아이가 장애가 있습니다. 혹시..  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
