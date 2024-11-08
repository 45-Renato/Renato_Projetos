import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de Caça',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1- Qual tipo de animal é permitido a caça no Brasil?',
      'options': ['Ararajuba', 'Onça Pintada', 'Javali', 'Cervo do Pantanal'],
      'answer': 2
    },
    {
      'question': '2- Quais as melhores armas para caça?',
      'options': ['270 Winchester', 'Balestra', '.44 Magnum', '.454 Casull'],
      'answer': 1
    },
    {
      'question': '3- Quais melhores cães para essa caça?',
      'options': ['Vira Lata', 'Foxhound Americano', 'Caramelo', 'Salsicha'],
      'answer': 1
    },
    {
      'question': '4- Qual o melhor bioma para caça de javalis?',
      'options': ['Mata', 'Cerrado', 'Neve', 'Deserto'],
      'answer': 1
    },
    {
      'question': '5- O que é considerado caça ilegal no Brasil?',
      'options': ['Javali', 'Paca', 'Cervo', 'Onça Pintada'],
      'answer': 3
    },
    {
      'question': '6- Qual é o nome da técnica usada para caça com cães?',
      'options': ['Cercado', 'Atalhamento', 'Hunting', 'Cão de Fuga'],
      'answer': 2
    }
  ];

  void _answerQuestion(int selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= _questions.length) {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Concluído!'),
        content:
            Text('Você acertou $_score de ${_questions.length} perguntas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetQuiz();
            },
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Caça'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuizQuestion()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Parabéns! Você concluiu o quiz de caça.',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Image.network(
                    'https://www.creativefabrica.com/wp-content/uploads/2021/09/28/Comic-speech-bubbles-with-text-quiz-Graphics-17996889-1-1-580x387.jpg',
                    height: 200,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildQuizQuestion() {
    final question = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...List.generate(question['options'].length, (index) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(index),
              child: Text(question['options'][index]),
            );
          }),
        ],
      ),
    );
  }
}
