import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // เรียก ensureInitialized() ที่นี่
  await Firebase.initializeApp();
  runApp(const Quiz());
}
