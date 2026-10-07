import 'package:flutter/foundation.dart';

class LessonNode {
  final int level;
  bool isCompleted;
  bool isLocked;

  LessonNode({
    required this.level,
    required this.isCompleted,
    required this.isLocked,
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
        LessonNode(level: 1, isCompleted: true, isLocked: false),
        LessonNode(level: 2, isCompleted: false, isLocked: false),
        LessonNode(level: 3, isCompleted: false, isLocked: true),
        LessonNode(level: 4, isCompleted: false, isLocked: true),
        LessonNode(level: 5, isCompleted: false, isLocked: true),
      ],
    ),
    'Bahasa Jepang': LanguageProgress(
      unitTitle: 'Level Dasar: Huruf Hiragana',
      unitDescription: 'Mulai perjalananmu dengan mempelajari huruf Hiragana dan salam sehari-hari.',
      lessons: [
        LessonNode(level: 1, isCompleted: false, isLocked: false),
        LessonNode(level: 2, isCompleted: false, isLocked: true),
        LessonNode(level: 3, isCompleted: false, isLocked: true),
        LessonNode(level: 4, isCompleted: false, isLocked: true),
        LessonNode(level: 5, isCompleted: false, isLocked: true),
      ],
    ),
    'Bahasa Korea': LanguageProgress(
      unitTitle: 'Level Dasar: Hangeul',
      unitDescription: 'Kuasai alfabet Hangeul dan kalimat sapaan formal.',
      lessons: [
        LessonNode(level: 1, isCompleted: true, isLocked: false),
        LessonNode(level: 2, isCompleted: true, isLocked: false),
        LessonNode(level: 3, isCompleted: true, isLocked: false),
        LessonNode(level: 4, isCompleted: false, isLocked: false),
        LessonNode(level: 5, isCompleted: false, isLocked: true),
      ],
    ),
    'Bahasa Inggris': LanguageProgress(
      unitTitle: 'Level Dasar: Vocabulary',
      unitDescription: 'Pelajari aturan tata bahasa dasar dan kosakata umum.',
      lessons: [
        LessonNode(level: 1, isCompleted: true, isLocked: false),
        LessonNode(level: 2, isCompleted: true, isLocked: false),
        LessonNode(level: 3, isCompleted: false, isLocked: false),
        LessonNode(level: 4, isCompleted: false, isLocked: true),
        LessonNode(level: 5, isCompleted: false, isLocked: true),
      ],
    ),
    'Bahasa Mandarin': LanguageProgress(
      unitTitle: 'Level Dasar: Pinyin',
      unitDescription: 'Pahami sistem Pinyin dan empat nada dasar bahasa Mandarin.',
      lessons: [
        LessonNode(level: 1, isCompleted: false, isLocked: false),
        LessonNode(level: 2, isCompleted: false, isLocked: true),
        LessonNode(level: 3, isCompleted: false, isLocked: true),
        LessonNode(level: 4, isCompleted: false, isLocked: true),
        LessonNode(level: 5, isCompleted: false, isLocked: true),
      ],
    ),
  },
);