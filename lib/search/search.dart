import 'dart:math';

import 'package:best_friend/api/article_model.dart';
import 'package:best_friend/api/data_of_articles.dart';
import 'package:best_friend/appBar/BFAppBar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Search extends StatefulWidget {
  const Search({super.key});

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
      appBar: const BFAppBar(appBarFunction: 4),
      body: Column(
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
            const Text(
              '검색 결과...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            for (var i = 0; i < min(10, filteredList.length); i++)
              GestureDetector(
                onTap: () => launchUrl(Uri.parse(filteredList[i].url)),
                child: Container(
                  // Your container code...
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      '${i + 1}. ${filteredList[i].title}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            for (var i = 0; i < 10 - min(10, filteredList.length); i++)
              const SizedBox(height: 40),
          ],
        ],
      ),
    );
  }
}
