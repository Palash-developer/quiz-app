import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answers/answers_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_controller.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    final ClickController clickController = Get.put(ClickController());

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      questions[clickController.currentQuestionIndex.value]
                          .text,
                      style: GoogleFonts.aladin(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...questions[clickController.currentQuestionIndex.value]
                        .getSuffledAnswers()
                        .map(
                          (e) => AnswerButton(
                            ansTxt: e,
                            onTap: () {
                              // clickController.chooseAnswer(e);
                              clickController.nextQuestionAnswer(e);
                            },
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
