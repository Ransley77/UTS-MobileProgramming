import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playCorrect() async {
    await _player.stop();
    await _player.play(AssetSource('sound/correct.mp3'));
  }

  static Future<void> playFalse() async {
    await _player.stop();
    await _player.play(AssetSource('sound/false.mp3'));
  }

  static Future<void> playLose() async {
    await _player.stop();
    await _player.play(AssetSource('sound/lose.mp3'));
  }

  static Future<void> playDoneAndLevelUp() async {
    await _player.stop();
    await _player.play(AssetSource('sound/done.mp3'));
    await Future.delayed(const Duration(milliseconds: 1500));
    await _player.stop();
    await _player.play(AssetSource('sound/level-up.mp3'));
  }
} 