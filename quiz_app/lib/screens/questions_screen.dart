import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  int totalScore = 0;

  //shuffledAnswer
  List<String> get shuffledAnswer {
    final currentQuestion = questions[currentQuestionIndex];
    return currentQuestion.shuffledAnswer;
  }

  void answerQustion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final totalQuestion = questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz App',
          style: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 24,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple, //AppBar Color
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.quiz_rounded,
              size: 27,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 233, 241), //bg color
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / totalQuestion,
            backgroundColor:
                const Color.fromARGB(255, 255, 255, 255), //color Progress
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color.fromARGB(57, 129, 0, 78),
            ),
            minHeight: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              'Question ${currentQuestionIndex + 1} of $totalQuestion',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Prompt',
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Prompt',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...shuffledAnswer.map(
                    (answer) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: AnswerButton(
                          answerText: answer,
                          onTap: () {
                            answerQustion(answer);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
