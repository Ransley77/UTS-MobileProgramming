import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../screens/lesson_screens.dart'; // Ganti QuizScreen ke LessonScreen

class LessonPath extends StatefulWidget {
  const LessonPath({super.key});

  @override
  State<LessonPath> createState() => _LessonPathState();
}

class _LessonPathState extends State<LessonPath> {
  // Mapper untuk menyesuaikan string Bahasa di UserData ke format kode LessonScreen
  String _mapLanguageCode(String fullLanguageName) {
    switch (fullLanguageName) {
      case 'Bahasa Spanyol':
        return 'spain';
      case 'Bahasa Jepang':
        return 'jepang';
      case 'Bahasa Inggris':
        return 'inggris';
      case 'Bahasa Korea':
        return 'korea';
      case 'Bahasa Mandarin':
        return 'mandarin';
      default:
        return 'spain';
    }
  }

  void _completeLevel(LessonNode lesson, int index, List<LessonNode> lessons) {
    setState(() {
      lesson.isCompleted = true;
      if (index + 1 < lessons.length) {
        lessons[index + 1].isLocked = false;
      }
    });

    dummyUser.xp.value += 20;

    if (dummyUser.dailyMissionProgress.value < dummyUser.dailyMissionTarget) {
      dummyUser.dailyMissionProgress.value += 1;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Level ${lesson.level} Selesai (+20 XP)')),
    );
  }

  Color _getActiveColor(String language) {
    switch (language) {
      case 'Bahasa Spanyol':
      case 'Bahasa Jepang':
        return Colors.red.shade600;
      case 'Bahasa Korea':
        return Colors.blue.shade600;
      case 'Bahasa Inggris':
        return Colors.indigo.shade700;
      case 'Bahasa Mandarin':
        return Colors.red.shade800;
      default:
        return Colors.orange.shade600;
    }
  }

  Color _getCompletedColor(String language) {
    switch (language) {
      case 'Bahasa Spanyol':
        return Colors.amber.shade500;
      case 'Bahasa Jepang':
        return Colors.red.shade300;
      case 'Bahasa Korea':
        return Colors.red.shade400;
      case 'Bahasa Inggris':
        return Colors.red.shade500;
      case 'Bahasa Mandarin':
        return Colors.amber.shade600;
      default:
        return Colors.orange.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<double> zigzagOffsets = [0, 45, 75, 45, 0, -45, -75, -45];

    return ValueListenableBuilder<String>(
      valueListenable: dummyUser.currentLanguage,
      builder: (context, currentLang, child) {
        final lessons = dummyUser.languages[currentLang]!.lessons;
        final Color activeColor = _getActiveColor(currentLang);
        final Color completedColor = _getCompletedColor(currentLang);

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            final double offsetX = zigzagOffsets[index % zigzagOffsets.length];

            Color buttonColor = Colors.grey.shade300;
            IconData iconData = Icons.lock_rounded;
            double buttonSize = 70.0;
            Color numberColor = Colors.grey.shade300;

            if (lesson.isCompleted) {
              buttonColor = completedColor;
              iconData = Icons.check_rounded;
              numberColor = completedColor;
            } else if (!lesson.isLocked) {
              buttonColor = activeColor;
              iconData = Icons.star_rounded;
              buttonSize = 85.0;
              numberColor = activeColor;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Transform.translate(
                offset: Offset(offsetX, 0),
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: offsetX >= 0 ? -45 : null,
                        right: offsetX < 0 ? -45 : null,
                        child: Text(
                          '${lesson.level}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: numberColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: buttonSize,
                        height: buttonSize,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: const CircleBorder(),
                            elevation: lesson.isLocked ? 0.0 : 8.0,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: lesson.isLocked
                              ? null
                              : () {
                                  // Pemetaan nama bahasa ke kode 'spain', 'jepang', dll.
                                  final String langCode = _mapLanguageCode(currentLang);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LessonScreen(
                                        language: langCode,
                                      ),
                                    ),
                                  ).then((isSuccess) {
                                    if (isSuccess == true && !lesson.isCompleted) {
                                      _completeLevel(lesson, index, lessons);
                                    }
                                  });
                                },
                          child: Icon(
                            iconData,
                            color: Colors.white,
                            size: buttonSize * 0.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}