import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Фотогалерея',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

}

class Photo {
  final String id;
  final String url;
  final String thumbUrl;

  Photo({required this.id, required this.url, required this.thumbUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['urls']['regular'],
      thumbUrl: json['urls']['thumb'],
    );
  }
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  PhotoList({required this.photos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: Image.network(photos[index].thumbUrl, fit: BoxFit.cover),
        );
      },
    );
  }
}