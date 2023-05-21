import 'package:best_friend/api/data_of_articles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:best_friend/api/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  final String link, queryString;
  const Articles({super.key, required this.link, required this.queryString});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Article> articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }

  Future<void> getWebsiteData() async {
    print(widget.link);
    final url = Uri.parse(widget.link);
    final response = await http.get(url);
    final document = parser.parse(response.body);
    //dom.Document html = dom.Document.html(response.body);

    final mainTitles = document
        .querySelectorAll(widget.queryString)
        .map((element) => element.innerHtml.trim())
        .toList();

    final links = document.querySelectorAll('td.td_subject.text-left > a');

    List<String> titles = [];
    List<String> detailLink = [];

    print('Count: ${mainTitles.length}');
    for (var title in mainTitles) {
      var doc = parser.parseFragment(title);
      doc.querySelectorAll('span').forEach((span) => span.remove());
      String docString = doc.text!.replaceAll('[]', '');

      titles.add(docString);
    }

    for (var link in links) {
      detailLink.add(link.attributes['href']!);
      print(link.attributes['href']);
    }

    setState(() {
      articles = List.generate(
        titles.length,
        (index) =>
            Article(url: detailLink[index], title: titles[index], urlImage: ''),
      );

      DataOfArticles list = DataOfArticles();
      DataOfArticles.listArticles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: articles.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          },
          itemBuilder: (context, index) {
            final article = articles[index];
            return GestureDetector(
              onTap: () => launchUrl(Uri.parse(articles[index].url)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  width: 150,
                  child: ListTile(
                    title: Text(
                      article.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
