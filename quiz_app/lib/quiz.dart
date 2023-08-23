import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/screens/createquiz_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'screens/questions_screen.dart';
import 'screens/reslt_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeScreen = 'start-screen'; // remark
  final List<String> _selectedAnswer = [];

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _goToCreateQuizScreen() {
    setState(() {
      _activeScreen = 'createquiz-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswer.add(answer);

    if (_selectedAnswer.length == questions.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswer.clear();
      _activeScreen = 'questions-screen';
    });
  }

  void resetToHome() {
    setState(() {
      _selectedAnswer.clear();
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chooseAnswers: _selectedAnswer,
        onRestart: restartQuiz,
        onHome: resetToHome,
      );
    }

    if (_activeScreen == 'createquiz-screen') {
      screenWidget = CreateQuizScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
