import 'package:get/get.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/score_screen.dart';

class ClickController extends GetxController {
  var currentQuestionIndex = 0.obs;

  var score = 0.obs;

  List<String> selectedAnswer = [];

  void nextQuestionAnswer(ans) {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    }
    chooseAnswer(ans);
    if (selectedAnswer.length == questions.length) {
      Get.to(() => ScoreScreen(chosenAns: selectedAnswer));
    }
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
  }

  void reset() {
    currentQuestionIndex = 0.obs;
    score = 0.obs;
    selectedAnswer = [];
  }
}
