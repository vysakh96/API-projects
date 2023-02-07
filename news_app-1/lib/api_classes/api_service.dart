import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_paper_app/api_classes/article_model.dart';

class ApiService {
  Future<List<Article>> getArticle() async {
    final url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-01-06&sortBy=publishedAt&apiKey=25ffee44024c4f8b9c9940fcb59fe773';
    var respose = await http.get(Uri.parse(url));
    if (respose.statusCode == 200) {
      var body = json.decode(respose.body);
      List<Article> _data = List<Article>.from(
          body['articles'].map((e) => Article.fromJson(e)).toList());

      return _data;
    } else {
      List<Article> _data = [];
      return _data;
    }
  }
}
