import 'package:quiz_app/models/quiz_question.dart';

final questions = [
  const QuizQuestion(
    'What is the "const" keyword ',
    [
      'Used when the value of the variable is known at compile-time and never changes',
      'May the force be with you.',
      'I don\'t know.',
      'GGWP',
    ],
  ),
  const QuizQuestion(
    'What is pubspec.yaml file?',
    [
      'It is the project\'s configuration file that will use a lot during working with the Flutter',
      'I love You.',
      'I don\'t know.',
      'Yay',
    ],
  ),
  const QuizQuestion(
    'What is Container?',
    [
      'Convenience widget that combines common painting, positioning, and sizing of widgets',
      'I don\'t know.',
      'I don\'t know.',
      'I don\'t know.',
    ],
  ),
  const QuizQuestion(
    'What is StatelessWidget?',
    [
      'A stateless widget never changes. Icon, IconButton, and Text are examples of stateless widgets.',
      'I don\'t know.',
      'I don\'t know.',
      'I don\'t know.',
    ],
  ),
  const QuizQuestion(
    'What is StatefulWidget',
    [
      'if a widget can change—when a user interacts with it, for example',
      'I don\'t know.',
      'I don\'t know.',
      'I don\'t know.',
    ],
  ),
];
