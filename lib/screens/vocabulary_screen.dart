import 'package:flutter/material.dart';

import '../widgets/vocabulary/category_chip.dart';
import '../widgets/vocabulary/favorite_button.dart';
import '../widgets/vocabulary/audio_button.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Vocabulary',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryChip(label: 'Noun'),
            SizedBox(height: 20),
            FavoriteButton(),
            SizedBox(height: 20),
            AudioButton(audioUrl: 'test.mp3'),
          ],
        ),
      ),
    );
  }
}
