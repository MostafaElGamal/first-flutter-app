import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;

  void _changeAnswers(num index) {
    setState(() {
      this._index = index;
    });
    print('id ${this._index}');
  }

  @override
  Widget build(BuildContext context) {
    var scaffOld, appBar, body, questionsData, questionsWidgets, answersWidgets;

    appBar = AppBar(
      title: Text('First App'),
    );

    questionsData = [
      {
        'id': 0,
        'questionText': 'Question1',
        'answers': [
          'Black',
          'Red',
          'white',
        ]
      },
      {
        'id': 1,
        'questionText': 'Question2',
        'answers': [
          'Snak',
          'Rabbit',
          'Lion',
        ]
      },
      {
        'id': 2,
        'questionText': 'Question3',
        'answers': [
          'Max',
          'Louis',
          'Me',
        ]
      },
    ];

    questionsWidgets = questionsData.map((ele) {
      Widget child = Question(
        question: ele,
        changeQuestion: _changeAnswers,
      );
      return Expanded(child: child);
    }).toList();

    answersWidgets = questionsData[this._index]['answers'].map((ele) {
      return Answer(text: ele);
    }).toList();

    body = Column(
      children: [
        Row(
          children: [
            ...questionsWidgets,
          ],
        ),
        ...answersWidgets,
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
