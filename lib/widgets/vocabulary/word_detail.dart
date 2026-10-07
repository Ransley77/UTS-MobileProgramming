import 'package:flutter/material.dart';

class WordDetail extends StatelessWidget {
  final String partOfSpeech;
  final String phonetic;

  const WordDetail({
    super.key,
    required this.partOfSpeech,
    required this.phonetic,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.0,
      children: [
        Text(
          partOfSpeech,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey.shade600,
            fontSize: 16,
          ),
        ),
        Text(
          '[$phonetic]',
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
