import 'package:best_friend/buttons/style_elevated_button.dart';
import 'package:best_friend/main_screens/main_community.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/textfields/input.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  // 여기에서 입력된 값을 handling 함.
  void textChanged(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '글쓰기',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Input(
                  category: '제목',
                  sizeOfBox: 240,
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                StyleOfElevatedButton(
                    text: '사진',
                    round: 10,
                    bgColor: Colors.grey,
                    textColor: Colors.black,
                    size: 20,
                    detailedScreen: CommunityScreen()),
                SizedBox(
                  width: 20,
                ),
                StyleOfElevatedButton(
                  text: '동영상',
                  round: 10,
                  bgColor: Colors.grey,
                  textColor: Colors.black,
                  size: 20,
                  detailedScreen: CommunityScreen(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 700,
              height: 450,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: SizedBox(
                width: 700,
                height: 200,
                child: TextField(
                  onChanged: textChanged,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    labelText: '내용을 입력하세요',
                  ),
                ),
              ),
            ),
            const StyleOfElevatedButton(
                text: '글올리기',
                round: 10,
                bgColor: Color.fromARGB(255, 218, 130, 159),
                textColor: Colors.black,
                size: 20,
                detailedScreen: CommunityScreen()),
          ],
        ),
      ),
    );
  }
}
