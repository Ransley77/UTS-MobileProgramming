enum TipeSoal {
  pilihanganda,
  ketikkan,
  susunkata,
}

class Lesson {
  final TipeSoal type;
  final String question;
  final List<String> options;
  final String correctAnswer;

  const Lesson({
    required this.type,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}