import 'package:flutter/material.dart';

import 'screens/vocabulary_screen.dart';

void main() {
  runApp(const QuadraApp());
}

class QuadraApp extends StatelessWidget {
  const QuadraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quadra',
      home: VocabularyScreen(),
    );
  }
}
