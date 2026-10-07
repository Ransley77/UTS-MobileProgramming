import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playCorrect() async {
    await _player.stop();
    await _player.play(AssetSource('sound/correct.MP3'));
  }

  static Future<void> playFalse() async {
    await _player.stop();
    await _player.play(AssetSource('sound/false.MP3'));
  }

  static Future<void> playLose() async {
    await _player.stop();
    await _player.play(AssetSource('sound/lose.MP3'));
  }

  static Future<void> playDoneAndLevelUp() async {
    await _player.stop();
    await _player.play(AssetSource('sound/done.MP3'));
    await Future.delayed(const Duration(milliseconds: 1500));
    await _player.stop();
    await _player.play(AssetSource('sound/level-up.MP3'));
  }
} 