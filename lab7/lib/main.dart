import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Возвращение значения')),
      body: Center(child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => const SecondScreen(),
          ));
        },
        child: const Text('Приступить к выбору'),
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(),
      '/second': (BuildContext context) => const SecondScreen(),
    },
  ));
}