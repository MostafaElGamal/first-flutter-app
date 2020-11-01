import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  num score;
  Function restExam;

  Result({this.score, this.restExam});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              'Your Result is $score',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ),
        RaisedButton(
          onPressed: restExam,
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: Text('Restart Exam'),
        )
      ],
    );
  }
}
