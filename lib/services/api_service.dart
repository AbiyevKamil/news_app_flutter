import 'dart:convert';

import 'package:news_app/models/news_data.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=399d957ecf1b4745ac1ec25aa9bfab7e';
  List<NewsData> data = [];

  Future<void> createList(dynamic info) async {
    for (int i = 0; i < info.length; i++) {
      final String author =
          info[i]['author'] == null ? 'Unknown author' : info[i]['author'];
      final String name = info[i]['source']['name'];
      final String title = info[i]['title'];
      final String description = info[i]['description'];
      final String publishedAt =
          info[i]['publishedAt'].toString().substring(0, 10);
      final String urlToImage = info[i]['urlToImage'];
      NewsData news = NewsData(
          author: author,
          description: description,
          publishedAt: publishedAt,
          title: title,
          urlToImage: urlToImage,
          error: false,
          name: name);
      data.add(news);
    }
  }

  Future<List<NewsData>> getData() async {
    try {
      final res = await get(Uri.parse(apiUrl));
      final parsedRes = await jsonDecode(res.body);
      await createList(parsedRes['articles']);
    } catch (err) {
      print(err);
    }
    return data;
  }
}
