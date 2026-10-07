import 'package:flutter/material.dart';

class LessonProgressHeader extends StatelessWidget {
  final double progress;
  final int lives;

  const LessonProgressHeader({
    super.key,
    required this.progress,
    required this.lives,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: Colors.grey.shade300,
              color: Colors.orange, // <-- Diubah dari Colors.green ke Colors.orange
            ),
          ),
        ),
        const SizedBox(width: 12),
        Row(
          children: List.generate(
            3,
            (index) => Icon(
              Icons.favorite,
              color: index < lives ? Colors.red : Colors.grey.shade300,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}