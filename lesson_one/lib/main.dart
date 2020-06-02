import 'package:flutter/material.dart';
import 'package:lesson_one/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() => setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      });

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'question': 'what\'s your favorite color?',
        'answer': [
          {'text': 'Green', 'score': 10},
          {'text': 'Blue', 'score': 6},
          {'text': 'White', 'score': 2},
          {'text': 'Yellow', 'score': 1},
        ],
      },
      {
        'question': 'waht\'s your favorite animal?',
        'answer': [
          {'text': 'Cat', 'score': 10},
          {'text': 'Dog', 'score': 5},
          {'text': 'Dolphin', 'score': 2}
        ],
      },
      {
        'question': 'How\'s your favorite teacher?',
        'answer': [
          {'text': 'Max', 'score': 1},
          {'text': 'Gal', 'score': 4},
          {'text': 'Daniel', 'score': 10},
          {'text': 'Nadav', 'score': 8}
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Self Quetions App!"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
