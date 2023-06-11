import 'package:best_friend/appBar/BFAppBar.dart';
import 'package:best_friend/buttons/style_elevated_button.dart';
import 'package:best_friend/buttons/toggle_button_kinds_of_disabled.dart';
import 'package:best_friend/community/post.dart';
import 'package:best_friend/community/readpage.dart';
import 'package:best_friend/search/search.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/api/fetch_articles.dart';

// <web scraping> https://www.youtube.com/watch?v=9ZfRE_DN9a0

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<Information> {
// ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 의 정렬 방식에 대한 논의 필요
      appBar: const BFAppBar(
        appBarFunction: 1,
      ),
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

            // 커뮤니티의 [자유], [정보]

            SizedBox(
              width: 20,
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
            // 커뮤니티 - 전체, 신체, 정신

            // 글 등록하기. (데이터 베이스 필요?)

            // 글 목록
            Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 첫번째 글 아무거나 수정해서 써주세요    ")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 두번째 글 아무거나 수정해서 써주세요    ")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 세번째 글 아무거나 수정해서 써주세요    ")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 네번째 글 아무거나 수정해서 써주세요    ")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 다섯번째 글 아무거나 수정해서 써주세요")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 여섯번째 글 아무거나 수정해서 써주세요")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 일곱번째 글 아무거나 수정해서 써주세요")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 여덟번째 글 아무거나 수정해서 써주세요")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 아홉번째 글 아무거나 수정해서 써주세요")),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReadPage()));
                    },
                    child: Text("정보 | 열번째 글 아무거나 수정해서 써주세요    ")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
