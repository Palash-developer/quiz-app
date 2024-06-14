class QuizQuestionModel {
  const QuizQuestionModel({required this.text, required this.answers});
  final String text;
  final List<String> answers;

  getSuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
