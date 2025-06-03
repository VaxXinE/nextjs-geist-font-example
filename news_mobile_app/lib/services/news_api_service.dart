import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsApiService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = 'YOUR_API_KEY'; // Replace with actual API key
  static const String _country = 'us';

  Future<List<Article>> getTopHeadlines() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/top-headlines?country=$_country&apiKey=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }

  Future<List<Article>> getNewsByCategory(String category) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/top-headlines?country=$_country&category=$category&apiKey=$_apiKey',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news for category: $category');
      }
    } catch (e) {
      throw Exception('Error fetching news by category: $e');
    }
  }
}
