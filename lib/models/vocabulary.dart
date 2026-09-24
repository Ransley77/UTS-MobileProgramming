class Vocabulary {
  final String id;
  final String word;
  final String translation;
  final String category;
  final String exampleSentence;
  final String exampleTranslation;
  final String audioUrl;
  bool isFavorite;

  Vocabulary({
    required this.id,
    required this.word,
    required this.translation,
    required this.category,
    required this.exampleSentence,
    required this.exampleTranslation,
    required this.audioUrl,
    this.isFavorite = false,
  });
}
