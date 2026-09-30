import 'package:flutter/material.dart';

class VocabularyCard extends StatelessWidget {
  final String word;
  final String translation;

  const VocabularyCard({
    super.key,
    required this.word,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade200, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            translation,
            style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
