import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;

  void _answerQuestion(num index) {
    setState(() {
      this._index = index;
    });
    print('Answer ${this._index}');
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
        Question(
          questions[this._index],
        ),
        RaisedButton(
          child: Text('Answe 1'),
          onPressed: () => _answerQuestion(0),
        ),
        RaisedButton(
          child: Text('Answe 2'),
          onPressed: () => _answerQuestion(1),
        ),
        RaisedButton(
          child: Text('Answe 3'),
          onPressed: () => _answerQuestion(2),
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
