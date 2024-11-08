import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String message = '';
  Color messageColor = Colors.black;

  void checkAnswer(String answer) {
    setState(() {
      if (answer == 'Brasília') {
        message = 'Resposta correta!';
        messageColor = Colors.green;
      } else {
        message = 'Resposta errada!';
        messageColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Qual é a capital do Brasil?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => checkAnswer('Rio de Janeiro'),
              child: Text('Rio de Janeiro'),
            ),
            SizedBox(height: 10), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () => checkAnswer('Brasília'),
              child: Text('Brasília'),
            ),
            SizedBox(height: 10), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () => checkAnswer('São Paulo'),
              child: Text('São Paulo'),
            ),
            SizedBox(height: 10), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () => checkAnswer('Salvador'),
              child: Text('Salvador'),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 20, color: messageColor),
            ),
          ],
        ),
      ),
    );
  }
}
