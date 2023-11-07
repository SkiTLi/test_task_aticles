import 'package:articles_app/models/article_data.dart';
import 'package:articles_app/screens/article_screen.dart';
import 'package:flutter/material.dart';

class PreviewArticle extends StatelessWidget {
  final ArticleData data;

 const  PreviewArticle({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Theme.of(context).primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  data.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          final route = MaterialPageRoute(
              builder: (_) => ArticleScreen(
                    data: data,
                  ));
          Navigator.push(context, route);
        },
      ),
    );
  }
}
