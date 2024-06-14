import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_controller.dart';
import 'package:quiz_app/screens/quiestions_screen.dart';
import 'package:quiz_app/screens/summary.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.chosenAns});

  final List<String> chosenAns;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAns[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final ClickController clickController = Get.put(ClickController());

    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnsweredQuestions = summaryData
        .where((element) => element["user_answer"] == element["correct_answer"])
        .length;

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You answred $numberOfCorrectAnsweredQuestions out of $numberOfTotalQuestions questions correctly!",
                  style: GoogleFonts.aladin(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                SingleChildScrollView(
                  child: ScoreSummary(summaryData),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    print("Going to questions screen!");
                    clickController.reset();
                    Get.to(
                      () => const WelcomeScreen(),
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Re-start Quiz",
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
