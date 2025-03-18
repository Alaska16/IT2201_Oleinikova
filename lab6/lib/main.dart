import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String? _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Text(
                'Ширина (мм):',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                controller: _widthController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Задайте Ширину';
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Высота (мм):',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Задайте Высоту';
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_heightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Введите Высоту'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      int? width = int.tryParse(_widthController.text);
                      int? height = int.tryParse(_heightController.text);
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'Вычислить',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                _result ?? '',
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Калькулятор площади')),
      body: MyForm(),
    ),
  ),
);