import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './loginForm.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  static const questions = [
    {
      'questionText': "What's your favorite animal?",
      'answers': ['Cat', 'Dog', 'Hamster', 'Parrot'],
    },
    {
      "questionText": "What's your favorite color?",
      'answers': ['Black', 'Blue', 'Red', 'Green'],
    }
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText']?.toString() ?? '',
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginForm()),
                );
              },
              child: Text('Go to Login form'),
            )
          ],
        ),
      ),
    );
  }
}
