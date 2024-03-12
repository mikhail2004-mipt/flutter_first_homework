import 'package:flutter/material.dart';
import '../models/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News news;

  NewsDetailsScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(news.imageUrl),
          Text(news.content),
          ElevatedButton(
            child: Text('Read More'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return WebView(
                      initialUrl: news.url,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}