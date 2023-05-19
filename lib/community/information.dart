import 'package:best_friend/appBar/BFAppBar.dart';
import 'package:best_friend/buttons/style_elevated_button.dart';
import 'package:best_friend/buttons/toggle_button_two_choices.dart';
import 'package:best_friend/main_screens/main_community.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/api/fetch_articles.dart';
import 'package:best_friend/api/fetch_notices.dart';

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
      ), // 여기서 에러 있었는데 gpt 가 고쳐줌.
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              width: 450,
              height: 30,
              color: const Color.fromARGB(255, 244, 247, 140),
            ),
            const SizedBox(
              height: 20,
            ),

            // 뉴스 기사(복지 정보)
            const Articles(
              link: "http://www.mapowelfare.or.kr/bbs/board.php?bo_table=0301",
              queryString: 'td.td_subject.text-left > a',
            ),
            const SizedBox(
              height: 10,
            ),

            // 커뮤니티의 [자유], [정보]
            const BFToggleButton(text1: '자유', text2: '정보'),
            const SizedBox(
              height: 9,
            ),
            // 커뮤니티 - 전체, 신체, 정신

            // 글 등록하기. (데이터 베이스 필요?)

            const SizedBox(
              height: 0,
            ),
            // 공지 사항
            const Notices(
              link: "http://www.mapowelfare.or.kr/bbs/board.php?bo_table=0305",
              queryString: "td.td_subject.text-left > a",
            )
          ],
        ),
      ),
    );
  }
}
