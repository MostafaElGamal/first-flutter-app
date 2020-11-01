import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  var _score = 0;
  bool _finishExam = false;

  void _changeAnswers(num index) {
    setState(() {
      this._index = index;
    });
    print('id ${this._index}');
  }

  void _selectAnswer(Map answer) {
    final score = answer['score'];
    setState(() {
      this._score = this._score + score;
      ++this._index;
      if (this._index >= 3) {
        --this._index;
        this._finishExam = true;
      }
    });
  }

  void _resetExam() {
    print('asdasd');
    setState(() {
      this._finishExam = false;
      this._score = 0;
      this._index = 0;
    });
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
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 20},
          {'text': 'white', 'score': 30},
        ]
      },
      {
        'id': 1,
        'questionText': 'Question2',
        'answers': [
          {'text': 'Snak', 'score': 8},
          {'text': 'Rabbit', 'score': 7},
          {'text': 'Lion', 'score': 1},
        ]
      },
      {
        'id': 2,
        'questionText': 'Question3',
        'answers': [
          {'text': 'Max', 'score': 2},
          {'text': 'Rami', 'score': 11},
          {'text': 'Me', 'score': 99},
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

    answersWidgets = questionsData[this._index]['answers'].map((answer) {
      return Answer(
        answer: answer,
        selectHandler: _selectAnswer,
      );
    }).toList();

    body = this._finishExam
        ? Result(score: this._score, restExam: _resetExam)
        : Column(
            children: [
              Row(
                children: [
                  ...questionsWidgets,
                ],
              ),
              ...answersWidgets,
              Text(
                this._score.toString(),
                style: TextStyle(fontSize: 20),
              )
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
