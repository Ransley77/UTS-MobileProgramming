import 'package:flutter/material.dart';

import 'audio_button.dart';
import 'example_sentence.dart';
import 'favorite_button.dart';
import 'word_detail.dart';

class VocabularyCard extends StatelessWidget {
  final Map item;
  final bool isFavorited;
  final VoidCallback onPlayWord;
  final VoidCallback onPlaySentence;
  final VoidCallback onToggleFavorite;

  const VocabularyCard({
    super.key,
    required this.item,
    required this.isFavorited,
    required this.onPlayWord,
    required this.onPlaySentence,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.orange.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['word']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      WordDetail(
                        partOfSpeech: item['partOfSpeech'] ?? 'noun',
                        phonetic: item['phonetic'] ?? '',
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['translation']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AudioButton(audioUrl: '', onPlay: onPlayWord),
                    FavoriteButton(
                      isFavorite: isFavorited,
                      onToggle: onToggleFavorite,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ExampleSentence(
                    sentence: item['exampleSentence']!,
                    meaning: item['exampleTranslation']!,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    size: 20,
                    color: Colors.orange,
                  ),
                  onPressed: onPlaySentence,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
