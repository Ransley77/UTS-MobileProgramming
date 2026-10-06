import 'package:flutter/material.dart';

import 'audio_button.dart';

class VocabularyCard extends StatelessWidget {
  final String word;
  final String translation;
  final VoidCallback onPlayAudio;

  const VocabularyCard({
    super.key,
    required this.word,
    required this.translation,
    required this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade200, width: 2),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: AudioButton(audioUrl: '', onPlay: onPlayAudio),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Align(
              alignment: Alignment.center,
              child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}
