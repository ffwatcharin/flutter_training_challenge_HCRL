import 'package:flutter/material.dart';
import 'package:quiz_app/screens/createquiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 233, 241),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              color: const Color.fromARGB(255, 88, 8, 84),
              width: 270,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Welcome to Quiz App',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Prompt',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 88, 8, 84),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton.icon(
              onPressed: startQuiz,
              icon: const Icon(
                Icons.star,
                color: Colors.purple,
              ),
              label: const Text(
                'Start Quiz',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CreateQuizScreen(), //start create quiz screen
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.purple,
              ),
              label: const Text(
                'Create Quiz',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Prompt',
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'ผมทำไม่ทันแล้ววววววว...',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
