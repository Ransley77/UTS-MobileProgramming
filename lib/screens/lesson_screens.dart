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
    double progress = (currentLessonIndex + 1) / lessons.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Bahasa Jepang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.grey.shade300,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                IconButton(
                  iconSize: 32,
                  icon: const Icon(Icons.volume_up, color: Colors.blue),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    currentLesson.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            Container(
              constraints: const BoxConstraints(
              minHeight: 80, ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                selectedAnswer ?? 'Pilih atau ketik jawaban di sini...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selectedAnswer == null ? Colors.grey : Colors.black,
                ),
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

                  if (isSelected) {
                    if (isAnswerChecked) {
                      if (selectedAnswer == currentLesson.correctAnswer) {
                        backgroundColor = Colors.green.shade100;
                        borderColor = Colors.green;
                      } else {
                        backgroundColor = Colors.red.shade100;
                        borderColor = Colors.red;
                      }
                    } else {
                      backgroundColor = Colors.blue.shade100;
                    }
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
            if (isAnswerChecked && selectedAnswer != currentLesson.correctAnswer)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'Jawaban yang benar: ${currentLesson.correctAnswer}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
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