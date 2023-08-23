import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(
    this.itemData, {
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });

  final Map<String, Object> itemData;
  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    Color borderColor = isCorrectAnswer ? Colors.green : Colors.red;
    // isCorrectAnswer = bool -> ternary operator true green, flase red

    return Row(
      //QuestionIdentifier
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor),
          ),
          child: Text(
            questionIndex.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Prompt',
              color: borderColor,
            ),
          ),
        ),

        const SizedBox(width: 20),
        // Expended ทำให้ Column กินพื้นที่ให้เยอะสุดเท่าที่ทำได้ - ลองลบออกเพื่อเทียบความต่างดูได้นะ
        // (จากที่เรียนในคลาสว่า Column กินพื้นที่บนล่างจนสุด(Height) แต่ซ้ายขวา(width)จะกว้างเท่ากับขนาด child widget)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 119, 46),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Your Answer : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: itemData['user_answer'].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Prompt',
                        color: isCorrectAnswer ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
