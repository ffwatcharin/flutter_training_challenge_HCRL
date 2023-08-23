import 'package:flutter/material.dart';

class CreateQuizScreen extends StatelessWidget {
  const CreateQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Create Quiz Screen!',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
