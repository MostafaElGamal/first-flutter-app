import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final Map question;
  final Function changeQuestion;

  Question({this.question, this.changeQuestion});

  @override
  Widget build(BuildContext context) {
    var boxDecration = BoxDecoration(
      color: Colors.green,
      border: Border.all(
        color: Colors.red,
      ),
    );

    Widget questionChild = Text(
      question['questionText'],
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );

    Widget questionContainer = Container(
        decoration: boxDecration,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        child: questionChild);

    return GestureDetector(
      onTap: () => changeQuestion(question['id']),
      child: questionContainer,
    );
  }
}
