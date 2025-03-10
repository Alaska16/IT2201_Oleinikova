import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инкремент',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 27;

  void _incrementCounterLike() {
    setState(() {
      _counter++;
    });
  }

  void _showMessage(String message) {
    setState(() {
      print(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // Замените URL ниже на ваш URL изображения
              Image.network('https://avatars.mds.yandex.net/i?id=15d3e3dc0b0bba0c378ffa3483537eb0da048bfe-10158740-images-thumbs&n=13'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Общежитие №20',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Краснодар, ул. Калинина, 13',
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    onPressed: _incrementCounterLike,
                    icon: Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                  ),
                  Text('$_counter'),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showMessage('Вызываем номер');
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Позвонить',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showMessage('Отображаем маршрут');
                          },
                          icon: Icon(
                            Icons.near_me,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Маршрут',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showMessage('Поделиться содержимым');
                          },
                          icon: Icon(
                            Icons.share,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Поделиться',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                child: Text('Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
