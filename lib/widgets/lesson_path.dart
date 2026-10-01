import 'package:flutter/material.dart';
import '../models/user_data.dart';

class LessonPath extends StatefulWidget {
  const LessonPath({super.key});

  @override
  State<LessonPath> createState() => _LessonPathState();
}

class _LessonPathState extends State<LessonPath> {
  void _showQuizDialog(BuildContext context, LessonNode lesson, int index, List<LessonNode> lessons) {
    List<String> options = [lesson.correctAnswer, lesson.wrongAnswer];
    options.shuffle();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Kuis Level ${lesson.level}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.question,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ...options.map((option) {
                bool isCorrect = option == lesson.correctAnswer;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      minimumSize: const Size(double.infinity, 50),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (isCorrect) {
                        _completeLevel(lesson, index, lessons);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Jawaban salah! Coba lagi.')),
                        );
                      }
                    },
                    child: Text(option),
                  ),
                );
              }),
            ],
          ),
        );
      }
    );
  }

  void _completeLevel(LessonNode lesson, int index, List<LessonNode> lessons) {
    setState(() {
      lesson.isCompleted = true;
      if (index + 1 < lessons.length) {
        lessons[index + 1].isLocked = false;
      }
    });

    if (dummyUser.dailyMissionProgress.value < dummyUser.dailyMissionTarget) {
      dummyUser.dailyMissionProgress.value += 1;
    }

    String temp = dummyUser.currentLanguage.value;
    dummyUser.currentLanguage.value = '';
    dummyUser.currentLanguage.value = temp;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Jawaban Benar! Level ${lesson.level} Selesai (+20%)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<double> zigzagOffsets = [0, 45, 75, 45, 0, -45, -75, -45];

    return ValueListenableBuilder<String>(
      valueListenable: dummyUser.currentLanguage,
      builder: (context, currentLang, child) {
        final lessons = dummyUser.languages[currentLang]!.lessons;

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
            
            if (lesson.isCompleted) {
              buttonColor = Colors.orange.shade400;
              iconData = Icons.check_rounded;
            } else if (!lesson.isLocked) {
              buttonColor = Colors.orange.shade600;
              iconData = Icons.star_rounded;
              buttonSize = 85.0;
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
                            color: lesson.isLocked ? Colors.grey.shade300 : Colors.orange.shade300,
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
                          onPressed: lesson.isLocked || lesson.isCompleted
                              ? null 
                              : () => _showQuizDialog(context, lesson, index, lessons),
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