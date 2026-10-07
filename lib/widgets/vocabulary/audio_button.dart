import 'package:flutter/material.dart';

class AudioButton extends StatelessWidget {
  final String audioUrl;
  final VoidCallback? onPlay;

  const AudioButton({super.key, required this.audioUrl, this.onPlay});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.volume_up_rounded),
      color: Colors.orange,
      iconSize: 28.0,
      onPressed: onPlay ?? () {},
    );
  }
}
