import 'package:flutter/foundation.dart';

class LessonNode {
  final int level;
  bool isCompleted;
  bool isLocked;
  final String question;
  final String correctAnswer;
  final String wrongAnswer;

  LessonNode({
    required this.level,
    required this.isCompleted,
    required this.isLocked,
    required this.question,
    required this.correctAnswer,
    required this.wrongAnswer,
  });
}

class LanguageProgress {
  final String unitTitle;
  final String unitDescription;
  final List<LessonNode> lessons;

  LanguageProgress({
    required this.unitTitle,
    required this.unitDescription,
    required this.lessons,
  });

  double get progressPercentage {
    int completed = lessons.where((l) => l.isCompleted).length;
    return completed / lessons.length;
  }
}

class UserData {
  final ValueNotifier<int> xp;
  final ValueNotifier<int> streak;
  final ValueNotifier<String> currentLanguage;
  
  final int dailyMissionTarget;
  final ValueNotifier<int> dailyMissionProgress;
  final ValueNotifier<bool> isDailyMissionClaimed;
  
  final Map<String, LanguageProgress> languages;

  UserData({
    required this.xp,
    required this.streak,
    required this.currentLanguage,
    required this.dailyMissionTarget,
    required this.dailyMissionProgress,
    required this.isDailyMissionClaimed,
    required this.languages,
  });
}

final dummyUser = UserData(
  xp: ValueNotifier<int>(450),
  streak: ValueNotifier<int>(12),
  currentLanguage: ValueNotifier<String>('Bahasa Spanyol'),
  dailyMissionTarget: 1,
  dailyMissionProgress: ValueNotifier<int>(0),
  isDailyMissionClaimed: ValueNotifier<bool>(false),
  languages: {
    'Bahasa Spanyol': LanguageProgress(
      unitTitle: 'Level Dasar: Perkenalan',
      unitDescription: 'Pelajari cara menyapa dan memperkenalkan diri dalam bahasa Spanyol.',
      lessons: [
        LessonNode(level: 1, isCompleted: true, isLocked: false, question: 'Apa bahasa Spanyol dari "Halo"?', correctAnswer: 'Hola', wrongAnswer: 'Adios'),
        LessonNode(level: 2, isCompleted: false, isLocked: false, question: 'Apa bahasa Spanyol dari "Terima kasih"?', correctAnswer: 'Gracias', wrongAnswer: 'Por favor'),
        LessonNode(level: 3, isCompleted: false, isLocked: true, question: 'Terjemahan dari kata "Buku":', correctAnswer: 'Libro', wrongAnswer: 'Gato'),
        LessonNode(level: 4, isCompleted: false, isLocked: true, question: 'Pilih kata untuk "Air":', correctAnswer: 'Agua', wrongAnswer: 'Fuego'),
        LessonNode(level: 5, isCompleted: false, isLocked: true, question: 'Terjemahan untuk "Satu":', correctAnswer: 'Uno', wrongAnswer: 'Dos'),
      ],
    ),
    'Bahasa Jepang': LanguageProgress(
      unitTitle: 'Level Dasar: Huruf Hiragana',
      unitDescription: 'Mulai perjalananmu dengan mempelajari huruf Hiragana dan salam sehari-hari.',
      lessons: [
        LessonNode(level: 1, isCompleted: false, isLocked: false, question: 'Apa bahasa Jepang dari "Halo"?', correctAnswer: 'Konnichiwa', wrongAnswer: 'Sayonara'),
        LessonNode(level: 2, isCompleted: false, isLocked: true, question: 'Apa bahasa Jepang dari "Terima kasih"?', correctAnswer: 'Arigatou', wrongAnswer: 'Sumimasen'),
        LessonNode(level: 3, isCompleted: false, isLocked: true, question: 'Terjemahan dari kata "Kucing":', correctAnswer: 'Neko', wrongAnswer: 'Inu'),
        LessonNode(level: 4, isCompleted: false, isLocked: true, question: 'Pilih kata untuk "Air":', correctAnswer: 'Mizu', wrongAnswer: 'Hi'),
        LessonNode(level: 5, isCompleted: false, isLocked: true, question: 'Terjemahan untuk "Satu":', correctAnswer: 'Ichi', wrongAnswer: 'Ni'),
      ],
    ),
    'Bahasa Korea': LanguageProgress(
      unitTitle: 'Level Dasar: Hangeul',
      unitDescription: 'Kuasai alfabet Hangeul dan kalimat sapaan formal.',
      lessons: [
        LessonNode(level: 1, isCompleted: true, isLocked: false, question: 'Apa bahasa Korea dari "Halo"?', correctAnswer: 'Annyeonghaseyo', wrongAnswer: 'Gamsahamnida'),
        LessonNode(level: 2, isCompleted: true, isLocked: false, question: 'Apa bahasa Korea dari "Terima kasih"?', correctAnswer: 'Gamsahamnida', wrongAnswer: 'Mianhaeyo'),
        LessonNode(level: 3, isCompleted: true, isLocked: false, question: 'Terjemahan dari kata "Cinta":', correctAnswer: 'Sarang', wrongAnswer: 'Jib'),
        LessonNode(level: 4, isCompleted: false, isLocked: false, question: 'Pilih kata untuk "Air":', correctAnswer: 'Mul', wrongAnswer: 'Bul'),
        LessonNode(level: 5, isCompleted: false, isLocked: true, question: 'Terjemahan untuk "Satu":', correctAnswer: 'Hana', wrongAnswer: 'Dul'),
      ],
    ),
    'Bahasa Inggris': LanguageProgress(
      unitTitle: 'Level Dasar: Vocabulary',
      unitDescription: 'Pelajari aturan tata bahasa dasar dan kosakata umum.',
      lessons: [
        LessonNode(level: 1, isCompleted: true, isLocked: false, question: 'Pilih kata yang tepat: Makan = ...', correctAnswer: 'Eat', wrongAnswer: 'Oat'),
        LessonNode(level: 2, isCompleted: true, isLocked: false, question: 'Pilih kata yang tepat: Tidur = ...', correctAnswer: 'Sleep', wrongAnswer: 'Slip'),
        LessonNode(level: 3, isCompleted: false, isLocked: false, question: 'Terjemahan dari kata "Buku":', correctAnswer: 'Book', wrongAnswer: 'Cook'),
        LessonNode(level: 4, isCompleted: false, isLocked: true, question: 'Pilih kata untuk "Air":', correctAnswer: 'Water', wrongAnswer: 'Waiter'),
        LessonNode(level: 5, isCompleted: false, isLocked: true, question: 'Terjemahan untuk "Berlari":', correctAnswer: 'Run', wrongAnswer: 'Ran'),
      ],
    ),
    'Bahasa Mandarin': LanguageProgress(
      unitTitle: 'Level Dasar: Pinyin',
      unitDescription: 'Pahami sistem Pinyin dan empat nada dasar bahasa Mandarin.',
      lessons: [
        LessonNode(level: 1, isCompleted: false, isLocked: false, question: 'Apa bahasa Mandarin dari "Halo"?', correctAnswer: 'Ni hao', wrongAnswer: 'Zai jian'),
        LessonNode(level: 2, isCompleted: false, isLocked: true, question: 'Apa bahasa Mandarin dari "Terima kasih"?', correctAnswer: 'Xie xie', wrongAnswer: 'Dui bu qi'),
        LessonNode(level: 3, isCompleted: false, isLocked: true, question: 'Terjemahan dari kata "Orang/Manusia":', correctAnswer: 'Ren', wrongAnswer: 'Kou'),
        LessonNode(level: 4, isCompleted: false, isLocked: true, question: 'Pilih kata untuk "Air":', correctAnswer: 'Shui', wrongAnswer: 'Huo'),
        LessonNode(level: 5, isCompleted: false, isLocked: true, question: 'Terjemahan untuk "Satu":', correctAnswer: 'Yi', wrongAnswer: 'Er'),
      ],
    ),
  },
);