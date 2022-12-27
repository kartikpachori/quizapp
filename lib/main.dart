import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerquestions() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favourite color',
        'answers': ['Black', 'Blue', 'Red', 'Green'],
      },
      {
        'questionText': 'What\'s your favourite animal',
        'answers': ['Rabbit', 'Lion', 'Tiger', 'Monkey'],
      },
      {
        'questionText': 'What\'s your favourite Player',
        'answers': ['Rohit', 'Virat', 'Sachin', 'Dhoni'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' My first app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions.elementAt(_questionIndex)['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerquestions, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
