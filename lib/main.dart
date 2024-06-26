import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: WelcomeScreen(),
    );
  }
}
