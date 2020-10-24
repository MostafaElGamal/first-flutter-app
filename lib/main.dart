import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var index = 0;

  void answerQuestion(num index) {
    this.index = index;
    print('Answer Clicked $this.index');
  }

  @override
  Widget build(BuildContext context) {
    var scaffOld, appBar, body, questions, index;

    appBar = AppBar(
      title: Text('First App'),
    );

    questions = [
      'Mustafa1',
      'Mustafa2',
      'Mustafa3',
    ];

    body = Column(
      children: [
        Text(
          questions[this.index],
        ),
        RaisedButton(
          child: Text('Answe 1'),
          onPressed: () => answerQuestion(0),
        ),
        RaisedButton(
          child: Text('Answe 2'),
          onPressed: () => answerQuestion(1),
        ),
        RaisedButton(
          child: Text('Answe 3'),
          onPressed: () => answerQuestion(2),
        ),
      ],
    );
    scaffOld = Scaffold(
      appBar: appBar,
      body: body,
    );

    return MaterialApp(
      home: scaffOld,
    );
  }
}
