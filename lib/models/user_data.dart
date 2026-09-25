class UserData {
  final int streak;
  final int xp;
  final String currentLanguage;
  final String currentUnit;
  final double progress;

  UserData({
    required this.streak,
    required this.xp,
    required this.currentLanguage,
    required this.currentUnit,
    required this.progress,
  });
}

final dummyUser = UserData(
  streak: 12,
  xp: 450,
  currentLanguage: 'Bahasa Spanyol',
  currentUnit: 'Unit 1: Perkenalan Dasar',
  progress: 0.8,
);