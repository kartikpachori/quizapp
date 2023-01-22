import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerquestions;

  Quiz(
      {required this.questions,
      required this.answerquestions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions.elementAt(questionIndex)['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerquestions(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
