import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "질문",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "저희 아이가 장애가 있습니다. 혹시 어떻게 대처해야 하나요?",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "17세 고등학생 프래더 윌리 남자아이 입니다. 아이가 계속해서 떼를 쓰거나, 먹는 것을 멈추지 않을 때는 다들 어떻게 하시나요? 살 찌면 안된다는데... 갈수록 말을 안들어서 너무너무 고민이네요.\n\n\n\n오늘도 햄버거를 말도 없이 두 개나 먹었어요... 아이를 훈육할 때도 어떻게 해야할지를 모르겠네요... 다들 어떻게 하시나요??"),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hintText: '댓글을 작성해주세요...',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('작성'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
