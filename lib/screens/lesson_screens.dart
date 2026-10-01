import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../lesson_data/lesson_data_jepang.dart';
import '../lesson_data/lesson_data_inggris.dart';
import '../lesson_data/lesson_data_spain.dart';
import '../widgets/lesson_progress_header.dart';
import '../widgets/lesson_answer_area.dart';

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
  int currentLessonIndex = 0;
  String? selectedAnswer;
  bool isAnswerChecked = false;
  int lives = 3;

  List<Lesson> get activeLessons {
    switch (widget.language.toLowerCase()) {
      case 'inggris':
        return lessonsInggris;
      case 'spain':
        return lessonsSpain;
      case 'jepang':
      default:
        return lessonsJepang;
    }
  }

  void nextLesson() {
    setState(() {
      if (currentLessonIndex < activeLessons.length - 1) {
        currentLessonIndex++;
        selectedAnswer = null;
        isAnswerChecked = false;
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Selesai!'),
            content: const Text('Selamat anda telah berhasil menyelesaikan semua soal.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentLessonIndex = 0;
                    selectedAnswer = null;
                    isAnswerChecked = false;
                    lives = 3;
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

  void checkAnswer() {
    setState(() {
      isAnswerChecked = true;
      if (selectedAnswer != activeLessons[currentLessonIndex].correctAnswer) {
        lives--;
        if (lives <= 0) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text('Kesempatan Anda Telah Habis!'),
              content: const Text('Nyawa anda sudah habis. Coba lagi dari awal.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      currentLessonIndex = 0;
                      selectedAnswer = null;
                      isAnswerChecked = false;
                      lives = 3;
                    });
                  },
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Lesson> lessons = activeLessons;
    Lesson currentLesson = lessons[currentLessonIndex];
    double progress = (currentLessonIndex + 1) / lessons.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Bahasa ${widget.language.toUpperCase()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LessonProgressHeader(
              progress: progress,
              lives: lives,
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
            
            AnswerArea(
              selectedAnswer: selectedAnswer,
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
      Color textColor = Colors.black;

      if (isSelected) {
        if (isAnswerChecked) {
          if (selectedAnswer == currentLesson.correctAnswer) {
            backgroundColor = Colors.green; // Hijau menyeluruh jika benar
            borderColor = Colors.green;
            textColor = Colors.white;
          } else {
            backgroundColor = Colors.red; // Merah menyeluruh jika salah
            borderColor = Colors.red;
            textColor = Colors.white;
          }
        } else {
          backgroundColor = Colors.blue.shade100;
          borderColor = Colors.blue;
          textColor = Colors.black;
        }
      }

      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            // Agar warna tetap hijau/merah penuh meski tombol dalam kondisi disabled
            disabledBackgroundColor: backgroundColor,
            disabledForegroundColor: textColor,
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
          child: Text(
            option,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
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
                  backgroundColor: Colors.orange, 
                  foregroundColor: Colors.white,
                ),
                onPressed: selectedAnswer == null
                    ? null
                    : () {
                        if (isAnswerChecked) {
                          nextLesson();
                        } else {
                          checkAnswer();
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