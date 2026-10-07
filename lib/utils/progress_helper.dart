import 'package:shared_preferences/shared_preferences.dart';

class ProgressHelper {
  static Future<int> getUnlockedNode(String language) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('unlocked_node_$language') ?? 1;
  }

  static Future<void> unlockNextNode(String language, int currentNode) async {
    final prefs = await SharedPreferences.getInstance();
    int currentUnlocked = await getUnlockedNode(language);
    if (currentNode >= currentUnlocked) {
      await prefs.setInt('unlocked_node_$language', currentNode + 1);
    }
  }
}