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

  }

  @override
  Widget build(BuildContext context) {

  }
}

class News {
}
