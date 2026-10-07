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

  static Future<void> playDone() async {
    await _player.stop();
    await _player.play(AssetSource('sound/done.MP3'));
  }

  static Future<void> playLevelUp() async {
    await _player.stop();
    await _player.play(AssetSource('sound/levelup.MP3'));
  }

  static Future<void> playCorrectAndLevelUp() async {
    await _player.stop();
    await _player.play(AssetSource('sound/correct.MP3'));
    await Future.delayed(const Duration(milliseconds: 2000));
    await _player.stop();
    await _player.play(AssetSource('sound/levelup.MP3'));
  }

  static Future<void> playDoneAndLevelUp() async {
    await _player.stop();
    await _player.play(AssetSource('sound/done.MP3'));
    await Future.delayed(const Duration(milliseconds: 2800));
    await _player.stop();
    await _player.play(AssetSource('sound/levelup.MP3'));
  }
}