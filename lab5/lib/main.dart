import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список элементов'),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: const [
            Text('0000'),
            Divider(),
            Text('0001'),
            Divider(),
            Text('0010'),
          ],
        ),
      ),
    );
  }
}