import 'package:flutter/material.dart';
import 'package:recipeapp/Answer.dart';
import 'package:recipeapp/questions.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstAppState();
  }
}

class _FirstAppState extends State<FirstApp> {
  var _questionIndex = 0;
  final questions = const [
    {
      'quenstionText': 'what is your fav color?',
      'answers': ['white', 'red', 'green', 'blue']
    },
    {
      'quenstionText': 'what is your fav animal?',
      'answers': ['dog', 'cat', 'rabit', 'elephant']
    },
    {
      'quenstionText': 'what is your instructor ?',
      'answers': ['max', 'max', 'max', 'max']
    },
  ];

  void _answerQuestions() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print("few more questions to go");
    } else {
      print("no more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Your choice"),
            backgroundColor: Colors.black12,
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Questions(questions[_questionIndex]['quenstionText']),
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestions, answer);
                    }).toList()
                  ],
                )
              : Center(
                  child: Text("You did it!!"),
                )),
    );
  }
}
