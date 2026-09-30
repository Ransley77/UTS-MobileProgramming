import 'package:flutter/material.dart';

class AnswerArea extends StatelessWidget {
  final String? selectedAnswer;

  const AnswerArea({
    super.key,
    required this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 80),
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
    );
  }
}