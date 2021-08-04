import 'package:flutter/material.dart';

// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    // throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_questionIndex);
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': "What's your favorite colour?",
        'answers': [
          {'text': 'Blue', 'score': 10},
          {'text': 'Black', 'score': 9},
          {'text': 'Red', 'score': 8},
          {'text': 'Pink', 'score': 7}
        ]
      },
      {
        'questionText': "What's your favorite food?",
        'answers': [
          {'text': 'Biryani', 'score': 10},
          {'text': 'Chicken Chilli', 'score': 9},
          {'text': 'Butter Paneer', 'score': 8},
          {'text': 'Masala Dosa', 'score': 7}
        ]
      },
      {
        'questionText': "What's your favorite animal?",
        'answers': [
          {'text': 'Lion', 'score': 10},
          {'text': 'Tiger', 'score': 9},
          {'text': 'Panda', 'score': 8},
          {'text': 'Elephant', 'score': 7}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
