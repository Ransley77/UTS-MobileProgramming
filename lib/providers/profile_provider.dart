import 'package:flutter_riverpod/legacy.dart';

class ProfileData {
  final String name;
  final String username;
  final int level;
  final int xp;
  final int streak;
  final int lessonsCompleted;
  final String language;
  final bool notificationsEnabled;
  final bool soundEnabled;

  const ProfileData({
    required this.name,
    required this.username,
    required this.level,
    required this.xp,
    required this.streak,
    required this.lessonsCompleted,
    required this.language,
    required this.notificationsEnabled,
    required this.soundEnabled,
  });

  ProfileData copyWith({
    String? name,
    String? username,
    int? level,
    int? xp,
    int? streak,
    int? lessonsCompleted,
    String? language,
    bool? notificationsEnabled,
    bool? soundEnabled,
  }) {
    return ProfileData(
      name: name ?? this.name,
      username: username ?? this.username,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      streak: streak ?? this.streak,
      lessonsCompleted: lessonsCompleted ?? this.lessonsCompleted,
      language: language ?? this.language,
      notificationsEnabled:
          notificationsEnabled ?? this.notificationsEnabled,
      soundEnabled: soundEnabled ?? this.soundEnabled,
    );
  }
}

final profileProvider = StateProvider<ProfileData>((ref) {
  return const ProfileData(
    name: 'Kevin',
    username: '@kevin',
    level: 5,
    xp: 450,
    streak: 12,
    lessonsCompleted: 5,
    language: 'Bahasa Spanyol',
    notificationsEnabled: true,
    soundEnabled: true,
  );
});