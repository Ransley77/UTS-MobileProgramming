import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final bool isAnswerChecked;
  final bool isCorrect;

  const CharacterWidget({
    super.key,
    required this.isAnswerChecked,
    required this.isCorrect,
  });

  String get characterAsset {
    if (!isAnswerChecked) {
      return 'assets/images/mascot_idle.gif';
    } else if (isCorrect) {
      return 'assets/images/mascot_happy.gif';
    } else {
      return 'assets/images/mascot_sad.gif';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Image.asset(
        characterAsset,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          IconData icon = Icons.face;
          Color color = Colors.orange;

          if (isAnswerChecked) {
            if (isCorrect) {
              icon = Icons.sentiment_very_satisfied;
              color = Colors.green;
            } else {
              icon = Icons.sentiment_very_dissatisfied;
              color = Colors.red;
            }
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: color),
              const SizedBox(height: 4),
              Text(
                'Slot Karakter: ${characterAsset.split('/').last}',
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}