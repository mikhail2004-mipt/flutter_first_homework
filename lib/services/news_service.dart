import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsService {
  final String apiKey = 'b183416d3be6475eb7ee1f593ed98630'; // Вам нужно получить ключ API на newsapi.org

  Future<List<News>> getNews() async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final List<News> newsList = [];
      final jsonData = json.decode(response.body);
      for (var article in jsonData['articles']) {
        newsList.add(News(
          title: article['title'] ?? '',
          content: article['description'] ?? '',
          imageUrl: article['urlToImage'] ?? '',
          url: article['url'] ?? '',
        ));
      }
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }
}