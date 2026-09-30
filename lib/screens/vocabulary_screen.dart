import 'package:flutter/material.dart';

import '../widgets/vocabulary/category_chip.dart';
import '../widgets/vocabulary/favorite_button.dart';
import '../widgets/vocabulary/audio_button.dart';
import '../widgets/vocabulary/vocabulary_card.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Quadra',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryChip(label: 'Noun'),
                FavoriteButton(),
              ],
            ),
            SizedBox(height: 40),
            VocabularyCard(word: 'El Libro', translation: 'Buku'),
            SizedBox(height: 30),
            AudioButton(audioUrl: 'test.mp3'),
          ],
        ),
      ),
    );
  }
}
