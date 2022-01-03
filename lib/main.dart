import "package:flutter/material.dart";

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        "questionText": "What's your favorite color?",
        "answers": ["Black", "Blue", "Peacock", "Green"]
      },
      {
        "questionText": "What's your favorite animal?",
        "answers": ["Monkey", "Lion", "Zebra", "Elephant"]
      },
      {
        "questionText": "Who's your favorite instructor?",
        "answers": ["Harry", "Max", "Carry", "Garry"]
      }
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]["questionText"]),
          ...(questions[_questionIndex]["answers"] as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
