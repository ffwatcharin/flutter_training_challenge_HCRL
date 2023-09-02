import 'package:flutter/material.dart';

class CreateQuizScreen extends StatefulWidget {
  CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _questionController = TextEditingController();
  TextEditingController _option1Controller = TextEditingController();
  TextEditingController _option2Controller = TextEditingController();
  TextEditingController _option3Controller = TextEditingController();
  TextEditingController _option4Controller = TextEditingController();

  List<Map<String, String>> questions = [];

  void _addQuestion() {
    if (_formKey.currentState!.validate()) {
      questions.add({
        'question': _questionController.text,
        'option1': _option1Controller.text,
        'option2': _option2Controller.text,
        'option3': _option3Controller.text,
        'option4': _option4Controller.text,
      });
      // Clear text fields
      _questionController.clear();
      _option1Controller.clear();
      _option2Controller.clear();
      _option3Controller.clear();
      _option4Controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _questionController,
                  decoration: const InputDecoration(labelText: 'Question'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a question.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _option1Controller,
                  decoration: const InputDecoration(labelText: 'Choice 1'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Choice 1.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _option2Controller,
                  decoration: const InputDecoration(labelText: 'Choice 2'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Choice 2.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _option3Controller,
                  decoration: const InputDecoration(labelText: 'Choice 3'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Choice 3.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _option4Controller,
                  decoration: const InputDecoration(labelText: 'Choice 4'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Choice 4.';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _addQuestion();
                },
                child: const Text('Add Question'),
              ),
              // Display the list of added questions and options
              ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Q: ${questions[index]['question']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. ${questions[index]['option1']}'),
                        Text('2. ${questions[index]['option2']}'),
                        Text('3. ${questions[index]['option3']}'),
                        Text('4. ${questions[index]['option4']}'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
