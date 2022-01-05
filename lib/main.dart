import "package:flutter/material.dart";

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 9},
        {"text": "Blue", "score": 8},
        {"text": "Peacock", "score": 10},
        {"text": "Green", "score": 7}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Monkey", "score": 10},
        {"text": "Lion", "score": 7},
        {"text": "Zebra", "score": 9},
        {"text": "Elephant", "score": 8}
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "Harry", "score": 9},
        {"text": "Max", "score": 10},
        {"text": "Carry", "score": 8},
        {"text": "Garry", "score": 7}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions to show!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Quizzes"),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
