class LessonNode {
  final int level;
  final bool isCompleted;
  final bool isLocked;

  LessonNode({
    required this.level,
    required this.isCompleted,
    required this.isLocked,
  });
}

class UserData {
  final int streak;
  final int xp;
  final String currentLanguage;
  final String currentUnit;
  final double progress;
  final int currentDailyXP;
  final int dailyGoalXP;
  final List<LessonNode> lessons;

  UserData({
    required this.streak,
    required this.xp,
    required this.currentLanguage,
    required this.currentUnit,
    required this.progress,
    required this.currentDailyXP,
    required this.dailyGoalXP,
    required this.lessons,
  });
}

final dummyUser = UserData(
  streak: 12,
  xp: 450,
  currentLanguage: 'Bahasa Spanyol',
  currentUnit: 'Unit 1: Perkenalan Dasar',
  progress: 0.8,
  currentDailyXP: 30,
  dailyGoalXP: 50,
  lessons: [
    LessonNode(level: 1, isCompleted: true, isLocked: false),
    LessonNode(level: 2, isCompleted: true, isLocked: false),
    LessonNode(level: 3, isCompleted: false, isLocked: false),
    LessonNode(level: 4, isCompleted: false, isLocked: true),
    LessonNode(level: 5, isCompleted: false, isLocked: true),
  ],
);