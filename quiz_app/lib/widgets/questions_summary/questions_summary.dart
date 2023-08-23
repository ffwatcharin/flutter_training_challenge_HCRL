import 'package:flutter/material.dart';
import 'summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.asMap().entries.map((entry) {
            final int questionIndex = entry.key + 1;
            final Map<String, Object> data = entry.value;
            final bool isCorrectAnswer =
                data['user_answer'] == data['correct_answer'];
            return SummaryItem(data,
                questionIndex: questionIndex, isCorrectAnswer: isCorrectAnswer);
          }).toList(),
        ),
      ),
    );
  }
}
