import 'package:shared_preferences/shared_preferences.dart';

import '../providers/profile_provider.dart';

class ProfileStorageService {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  Future<void> saveProfile(ProfileData profile) async {
    await _prefs.setString('profile_name', profile.name);
    await _prefs.setString('profile_username', profile.username);
    await _prefs.setInt('profile_level', profile.level);
    await _prefs.setInt('profile_xp', profile.xp);
    await _prefs.setInt('profile_streak', profile.streak);
    await _prefs.setInt('profile_lessons', profile.lessonsCompleted);
    await _prefs.setString('profile_language', profile.language);
    await _prefs.setBool('profile_notifications', profile.notificationsEnabled);
    await _prefs.setBool('profile_sound', profile.soundEnabled);
  }

  Future<ProfileData> loadProfile() async {
    String name = await _prefs.getString('profile_name') ?? 'Kevin';

    String username = await _prefs.getString('profile_username') ?? '@kevin';

    int level = await _prefs.getInt('profile_level') ?? 5;

    int xp = await _prefs.getInt('profile_xp') ?? 450;

    int streak = await _prefs.getInt('profile_streak') ?? 12;

    int lessonsCompleted = await _prefs.getInt('profile_lessons') ?? 5;

    String language =
        await _prefs.getString('profile_language') ?? 'Bahasa Spanyol';

    bool notificationsEnabled =
        await _prefs.getBool('profile_notifications') ?? true;

    bool soundEnabled = await _prefs.getBool('profile_sound') ?? true;

    return ProfileData(
      name: name,
      username: username,
      level: level,
      xp: xp,
      streak: streak,
      lessonsCompleted: lessonsCompleted,
      language: language,
      notificationsEnabled: notificationsEnabled,
      soundEnabled: soundEnabled,
    );
  }

  Future<void> saveImagePath(String path) async {
    await _prefs.setString('profile_image_path', path);
  }

  Future<String?> loadImagePath() async {
    return await _prefs.getString('profile_image_path');
  }
}
