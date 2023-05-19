import 'package:best_friend/api/article_model.dart';
import 'package:best_friend/api/data_of_articles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchText = "";
  final List<Article> dataList = DataOfArticles.listArticles;
  List<Article> filteredList = [];

  void _filterList() {
    filteredList = dataList
        .where((article) =>
            article.title.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '검색',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                    _filterList();
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            if (_searchText.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '검색 결과...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              for (var i = 0; i < filteredList.length; i++) ...[
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(filteredList[i].url)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 450,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 247, 254),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      // Your container code...
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Container(
                            child: Text(
                              '${i + 1}. ${filteredList[i].title}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Increased spacing between items
              ],
            ],
          ],
        ),
      ),
    );
  }
}
