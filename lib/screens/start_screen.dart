import 'package:articles_app/providers/articles_provider.dart';
import 'package:articles_app/widgets/preview_article.dart';
import 'package:flutter/material.dart';

final articles = ArticlesProvider().getArticles();

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: articles
            .map((e) => PreviewArticle(
                  data: e,
                ))
            .toList(),
      ),
    );
  }
}
