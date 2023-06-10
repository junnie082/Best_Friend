import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:best_friend/api/article_model.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class Notices extends StatefulWidget {
  final String link, queryString;

  const Notices({super.key, required this.link, required this.queryString});

  @override
  State<Notices> createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  static List<Article> notices = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformationData();
  }

  Future<void> getInformationData() async {
    final url = Uri.parse(widget.link);
    final response = await http.get(url);
    final document = parser.parse(response.body);
    //dom.Document html = dom.Document.html(response.body);

    final detailTitles = document
        .querySelectorAll(widget.queryString)
        .map((element) => element.innerHtml.trim())
        .toList();

    final links = document.querySelectorAll(widget.queryString);

    List<String> noticesTitles = [];
    List<String> noticesDetailLink = [];

    print('Count: ${detailTitles.length}');
    for (var title in detailTitles) {
      var doc = parser.parseFragment(title);
      doc.querySelectorAll('span').forEach((span) => span.remove());
      String docString = doc.text!.replaceAll('[]', '');

      noticesTitles.add(docString);
    }

    for (var link in links) {
      noticesDetailLink.add(link.attributes['href']!);
      print(link.attributes['href']);
    }

    setState(() {
      notices = List.generate(
        noticesTitles.length,
        (index) => Article(
            url: noticesDetailLink[index],
            title: noticesTitles[index],
            urlImage: ''),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (notices.isNotEmpty) ...[
          for (var i = 0; i < min(10, notices.length); i++)
            SizedBox(
              height: 40,
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse(notices[i].url)),
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(),
                  width: 400,
                  height: 26,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      '${i + 1}. ${notices[i].title}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ],
    );
  }
}
