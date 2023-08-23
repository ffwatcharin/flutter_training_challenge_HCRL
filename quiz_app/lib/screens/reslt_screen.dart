import 'package:flutter/material.dart';
import '../data/question.dart';
import '../widgets/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chooseAnswers,
    required this.onRestart,
    required this.onHome,
  });

  final List<String> chooseAnswers;
  final void Function() onRestart;
  final void Function() onHome;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQustions = questions.length;
    final numCorrectQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 233, 241),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Text(
                    'You answered correctly $numCorrectQuestion out of $numTotalQustions',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  QuestionSummary(summaryData),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton.icon(
                    onPressed: onRestart,
                    icon: const Icon(Icons.restart_alt, color: Colors.purple),
                    label: const Text(
                      'Restart Quiz!',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton.icon(
                      onPressed: onHome,
                      icon: const Icon(
                        Icons.home,
                        color: Colors.purple,
                      ),
                      label: const Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                            color: Colors.purple),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
