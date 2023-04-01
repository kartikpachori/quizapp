import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s Your Favourite color',
      'answers': [
        {'text': 'BLACK', 'score': 10},
        {'text': 'BLUE', 'score': 5},
        {'text': 'WHITE', 'score': 3},
        {'text': 'GREEN', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s Your Favourite Animal',
      'answers': [
        {'text': 'RABBIT', 'score': 3},
        {'text': 'LION ', 'score': 8},
        {'text': 'TIGER', 'score': 10},
        {'text': 'ELEPHANT', 'score': 5},
      ],
    },
    {
      'questionText': 'Who\'s Your Favourite Player',
      'answers': [
        {'text': 'DHONI', 'score': 3},
        {'text': 'SACHIN ', 'score': 8},
        {'text': 'VIRAT', 'score': 10},
        {'text': 'ROHIT', 'score': 5},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerquestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('no more quetions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerquestions: _answerquestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
