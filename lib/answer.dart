import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerHandler;
  final String answer;

  Answer(this.answerHandler, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(answer),
        onPressed: answerHandler,
      ),
    );
  }
}
