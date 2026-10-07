import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/lesson.dart';
import '../lesson_data/lesson_data_jepang.dart';
import '../lesson_data/lesson_data_inggris.dart';
import '../lesson_data/lesson_data_spain.dart';
import '../lesson_data/lesson_data_korea.dart';
import '../lesson_data/lesson_data_mandarin.dart';
import '../widgets/character_widget.dart';
import '../widgets/lesson_answer_area.dart';
import '../widgets/lesson_progress_header.dart';
import '../utils/audio_helper.dart';
import '../utils/progress_helper.dart';

class LessonScreen extends StatefulWidget {
  final String language;

  const LessonScreen({
    super.key,
    this.language = 'jepang',
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late List<Lesson> sessionLessons;
  int currentIndex = 0;
  String? selectedAnswer;
  dynamic answerState; 
  int lives = 3;

  final TextEditingController _typeController = TextEditingController();
  final List<String> _selectedWords = [];
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initSession();
    _initTts();
  }

  void _initSession() {
    List<Lesson> allLessons = activeLessons;
    allLessons.shuffle();
    sessionLessons = allLessons.take(5).toList();
  }

  List<Lesson> get activeLessons {
    switch (widget.language.toLowerCase()) {
      case 'inggris':
        return lessonsInggris;
      case 'spain':
        return lessonsSpain;
      case 'korea':
        return lessonsKorea;
      case 'mandarin':
        return lessonsMandarin;
      case 'jepang':
      default:
        return lessonsJepang;
    }
  }

  String get ttsLanguageCode {
    switch (widget.language.toLowerCase()) {
      case 'inggris': return 'en-US';
      case 'spain': return 'es-ES';
      case 'korea': return 'ko-KR';
      case 'mandarin': return 'zh-CN';
      case 'jepang':
      default: return 'ja-JP';
    }
  }

  void _initTts() async {
    await _flutterTts.setLanguage(ttsLanguageCode);
    await _flutterTts.setSpeechRate(0.45);
    _speakQuestion();
  }

  void _speakQuestion() async {
    if (sessionLessons.isNotEmpty) {
      await _flutterTts.stop();
      await _flutterTts.speak(sessionLessons[currentIndex].question);
    }
  }

  void checkAnswer() async {
    Lesson currentLesson = sessionLessons[currentIndex];

    if (currentLesson.type == TipeSoal.ketikkan) {
      selectedAnswer = _typeController.text.trim();
    } else if (currentLesson.type == TipeSoal.susunkata) {
      selectedAnswer = _selectedWords.join(' ').trim();
    }

    bool isCorrect = (selectedAnswer?.toLowerCase() == currentLesson.correctAnswer.toLowerCase());

    if (isCorrect) {
      await AudioHelper.playCorrect();
      setState(() {
        answerState = true;
      });
    } else {
      await AudioHelper.playFalse();
      setState(() {
        answerState = false;
        lives--;
      });
    }
  }

  void skipListening() {
    setState(() {
      answerState = 'skipped';
    });
  }

  void nextLesson() async {
    if (currentIndex < sessionLessons.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
        answerState = null;
        _typeController.clear();
        _selectedWords.clear();
      });
      _speakQuestion();
    } else {
      await ProgressHelper.unlockNextNode(widget.language, 1);
      await AudioHelper.playDoneAndLevelUp();

      if (!mounted) return;
      Navigator.pop(context, true);
    }
  }

  Future<bool> _onWillPop() async {
    bool? shouldLeave = await showModalBottomSheet<bool>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/image/sad.gif', height: 80),
              const SizedBox(height: 16),
              const Text(
                'You will lose all your progress in this lesson.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('KEEP LEARNING', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('LOSE PROGRESS', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
    return shouldLeave ?? false;
  }

  @override
  Widget build(BuildContext context) {
    Lesson currentLesson = sessionLessons[currentIndex];
    double progress = (currentIndex + 1) / sessionLessons.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldLeave = await _onWillPop();
        if (shouldLeave && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.grey, size: 28),
            onPressed: () async {
              if (await _onWillPop()) {
                if (context.mounted) Navigator.pop(context);
              }
            },
          ),
          title: LessonProgressHeader(
            progress: progress,
            lives: lives,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    CharacterWidget(
                      isAnswerChecked: answerState != null,
                      isCorrect: answerState == true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.volume_up, color: Colors.lightBlue, size: 32),
                          onPressed: _speakQuestion,
                        ),
                        Expanded(
                          child: Text(
                            currentLesson.question,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: LessonAnswerArea(
                        lesson: currentLesson,
                        selectedAnswer: selectedAnswer,
                        isAnswerChecked: answerState != null,
                        onAnswerSelected: (val) => setState(() => selectedAnswer = val),
                        typeController: _typeController,
                        selectedWords: _selectedWords,
                        onWordTapped: (word) {
                          setState(() {
                            if (_selectedWords.contains(word)) {
                              _selectedWords.remove(word);
                            } else {
                              _selectedWords.add(word);
                            }
                          });
                        },
                        onPlayAudio: _speakQuestion,
                      ),
                    ),
                    if (currentLesson.type == TipeSoal.dengarkata && answerState == null)
                      TextButton(
                        onPressed: skipListening,
                        child: const Text(
                          "CAN'T LISTEN NOW",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            _buildBottomFeedbackBar(currentLesson),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomFeedbackBar(Lesson currentLesson) {
    Color backgroundColor = Colors.transparent;
    Widget content = const SizedBox.shrink();

    if (answerState == true) {
      backgroundColor = Colors.lightGreen.shade100;
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 28),
              SizedBox(width: 8),
              Text('Nice catch!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: nextLesson,
              child: const Text('CONTINUE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      );
    } else if (answerState == false) {
      backgroundColor = Colors.red.shade100;
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.cancel, color: Colors.red, size: 28),
              SizedBox(width: 8),
              Text('Incorrect', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
          const SizedBox(height: 4),
          Text('Correct Answer:\n${currentLesson.correctAnswer}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: nextLesson,
              child: const Text('GOT IT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      );
    } else if (answerState == 'skipped') {
      backgroundColor = Colors.amber.shade100;
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("We'll skip listening for this lesson.", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: nextLesson,
              child: const Text('CONTINUE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      );
    } else {
      content = SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedAnswer != null ? Colors.lightGreen : Colors.grey.shade300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: selectedAnswer != null ? checkAnswer : null,
          child: const Text('CHECK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      color: backgroundColor,
      child: SafeArea(child: content),
    );
  }
}