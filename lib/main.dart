import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Letras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LetterCounterScreen(),
    );
  }
}

class LetterCounterScreen extends StatefulWidget {
  @override
  _LetterCounterScreenState createState() => _LetterCounterScreenState();
}

class _LetterCounterScreenState extends State<LetterCounterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _processedText = '';

  void _countLetters() {
    String inputText = _controller.text;
    if (inputText.isEmpty) {
      setState(() {
        _processedText = 'Ingrese texto';
      });
      return;
    }

    StringBuffer result = StringBuffer();
    int count = 1;

    for (int i = 1; i < inputText.length; i++) {
      if (inputText[i] == inputText[i - 1]) {
        count++;
      } else {
        result.write('${inputText[i - 1]}$count');
        count = 1;
      }
    }
    result.write('${inputText[inputText.length - 1]}$count');

    setState(() {
      _processedText = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Letras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingrese texto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _countLetters,
              child: Text('Procesar Texto'),
            ),
            SizedBox(height: 16),
            Text(
              'Texto Procesado:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              _processedText,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
