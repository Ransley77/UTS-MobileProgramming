class UserData {
  final int streak;
  final int xp;
  final String currentLanguage;
  final String currentUnit;
  final double progress;
  final int currentDailyXP;
  final int dailyGoalXP;

  UserData({
    required this.streak,
    required this.xp,
    required this.currentLanguage,
    required this.currentUnit,
    required this.progress,
    required this.currentDailyXP,
    required this.dailyGoalXP,
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
);