import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../lesson_data/lesson_data_jepang.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int currentLessonIndex = 0;
  String? selectedAnswer;
  bool isAnswerChecked = false;

  void nextLesson() {
    setState(() {
      if (currentLessonIndex < lessons.length - 1) {
        currentLessonIndex++;
        selectedAnswer = null;
        isAnswerChecked = false;
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Selesai!'),
            content: const Text('Kamu telah menyelesaikan semua soal.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentLessonIndex = 0;
                    selectedAnswer = null;
                    isAnswerChecked = false;
                  });
                },
                child: const Text('Ulangi'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Lesson currentLesson = lessons[currentLessonIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Bahasa Jepang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentLesson.question,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: currentLesson.options.length,
                itemBuilder: (context, index) {
                  String option = currentLesson.options[index];
                  bool isSelected = selectedAnswer == option;

                  Color backgroundColor = Colors.white;
                  Color borderColor = isSelected ? Colors.blue : Colors.grey;

                  if (isAnswerChecked && isSelected) {
                    if (selectedAnswer == currentLesson.correctAnswer) {
                      backgroundColor = Colors.green.shade100;
                      borderColor = Colors.green;
                    } else {
                      backgroundColor = Colors.red.shade100;
                      borderColor = Colors.red;
                    }
                  } else if (isSelected) {
                    backgroundColor = Colors.blue.shade100;
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        foregroundColor: Colors.black,
                        side: BorderSide(
                          color: borderColor,
                          width: 2,
                        ),
                      ),
                      onPressed: isAnswerChecked
                          ? null
                          : () {
                              setState(() {
                                selectedAnswer = option;
                              });
                            },
                      child: Text(option),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: selectedAnswer == null
                    ? null
                    : () {
                        if (isAnswerChecked) {
                          nextLesson();
                        } else {
                          setState(() {
                            isAnswerChecked = true;
                          });
                        }
                      },
                child: Text(
                  isAnswerChecked ? 'LANJUT' : 'CHECK',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}