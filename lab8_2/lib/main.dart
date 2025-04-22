import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лента новостей',
      theme: ThemeData(primarySwatch: Colors.green),
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<News>> futureNews;
  final http.Client client = http.Client();

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews(client);
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  Future<List<News>> fetchNews(http.Client client) async {
    try {
      final response = await client.get(
        Uri.parse(
          'https://newsapi.org/v2/everything?q=corgi&from=2025-04-20&sortBy=publishedAt&apiKey=621bd55da67c49ba8788a7048d53d8d4',
        ),
      );

      if (response.statusCode == 200) {
        print('Ответ сервера: ${response.body}');

        final Map<String, dynamic> body = jsonDecode(response.body);

        List<News> news = (body['articles'] as List)
            .map((dynamic item) => News.fromJson(item))
            .toList();
        return news;
      } else {
        throw Exception('Ошибка загрузки: ${response.statusCode}');
      }
    } catch (e) {
      print('Ошибка: $e');
      throw Exception('Не удалось загрузить новости: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

  }
}

class News {

}
