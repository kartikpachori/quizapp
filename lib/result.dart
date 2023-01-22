import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'You Are Dumb';
    } else if (resultScore <= 20) {
      resultText = 'You Are Innocent';
    } else if (resultScore <= 25) {
      resultText = 'You Are Strong';
    } else {
      resultText = 'You are Smart';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            onPressed: resetHandler,
            child: Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
