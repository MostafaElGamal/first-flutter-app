import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final num index;
  final String text;

  // Constructor
  Answer({this.selectHandler, this.index, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: RaisedButton(
        child: Text(text),
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: () => selectHandler(index),
      ),
    );
  }
}
