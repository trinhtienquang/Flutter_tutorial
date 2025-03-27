class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion({required this.text, required this.answers});

  List<String> getShuffedAnswers() {
    final shuffedList = List.of(answers);
    shuffedList.shuffle();
    return shuffedList;
  }
}
