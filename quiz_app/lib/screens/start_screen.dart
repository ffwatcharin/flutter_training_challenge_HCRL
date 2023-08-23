import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  // final void Function() createQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 225, 207, 240),
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
                ),
              ),
            ),
            TextButton.icon(
                onPressed: () {},
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
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
