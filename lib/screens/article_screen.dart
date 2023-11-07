import 'package:articles_app/models/article_data.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  final ArticleData data;


  const ArticleScreen({
    Key? key,
    required this.data,

  }) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool _zoomEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Article'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _zoomEnabled = !_zoomEnabled);
            },
            icon: const Icon(Icons.zoom_in),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.data.title,
                  style: TextStyle(
                    fontSize: _zoomEnabled ? 48 : 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.data.date,
                  style: TextStyle(
                    fontSize: _zoomEnabled ? 28 : 14,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.data.text,
                  style: TextStyle(
                    fontSize: _zoomEnabled ? 28 : 14,
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
