import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final int level;
  final String language;

  const QuizScreen({
    super.key,
    required this.level,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kuis')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Selesaikan Kuis'),
        ),
      ),
    );
  }
}