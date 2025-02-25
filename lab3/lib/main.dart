import 'package:flutter/material.dart';

void main() {
  runApp(const IncrementApp());
}

class IncrementApp extends StatelessWidget {
  const IncrementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инкремент',
      theme: ThemeData(
        primaryColor: Colors.orange, // Любой другой цвет
      ),
      home: const IncrementHomePage(title: ''),
    );
  }
}

class IncrementHomePage extends StatefulWidget {
  const IncrementHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<IncrementHomePage> createState() => _IncrementHomePageState();
}

class _IncrementHomePageState extends State<IncrementHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Счётчик'),
        backgroundColor: Colors.blue,
        leading: TextButton(
          onPressed: () {},
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Значение счётчика',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Icon(Icons.add),
                ),
              ],
            ),
            TextButton(
              onPressed: _resetCounter,
              child: Text(
                'Сбросить',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}