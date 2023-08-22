import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //QuestionIdentifier
        Container(
          decoration: const BoxDecoration(color: Colors.amber),
          alignment: Alignment.center,
          child: const Text(''),
        ),
        const SizedBox(width: 15),
        // Expended ทำให้ Column กินพื้นที่ให้เยอะสุดเท่าที่ทำได้ - ลองลบออกเพื่อเทียบความต่างดูได้นะ
        // (จากที่เรียนในคลาสว่า Column กินพื้นที่บนล่างจนสุด(Height) แต่ซ้ายขวา(width)จะกว้างเท่ากับขนาด child widget)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(
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
                ),
              ),
              Text(
                itemData['user_answer'].toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Prompt',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
