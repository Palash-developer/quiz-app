import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/quiz_controller.dart';
import 'package:quiz_app/screens/quiestions_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ClickController clickController = Get.put(ClickController());

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 400,
                    width: 400,
                    child: Image.asset("assets/images/quiz-logo.png"),
                  ),
                ),
                Center(
                  child: Text(
                    "Learn Flutter the fun way!",
                    style: GoogleFonts.aladin(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    print("Going to questions screen!");
                    Get.to(
                      () => QuestionsScreen(
                        onSelectAnswer: clickController.chooseAnswer,
                      ),
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Start Quiz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
