import '../models/vocabulary.dart';

final List dummyVocabularies = [
  Vocabulary(
    id: 'v1',
    word: 'Apple',
    translation: 'Apel',
    category: 'Noun',
    exampleSentence: 'I eat an apple every morning.',
    exampleTranslation: 'Saya makan sebuah apel setiap pagi.',
    audioUrl: 'assets/audio/apple.mp3',
  ),
  Vocabulary(
    id: 'v2',
    word: 'Run',
    translation: 'Berlari',
    category: 'Verb',
    exampleSentence: 'He likes to run in the park.',
    exampleTranslation: 'Dia suka berlari di taman.',
    audioUrl: 'assets/audio/run.mp3',
  ),
];
