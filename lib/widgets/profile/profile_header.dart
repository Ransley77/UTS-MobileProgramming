import 'package:flutter/material.dart';

import 'profile_image_widget.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String username;
  final int level;
  final int xp;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.username,
    required this.level,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImageWidget(),

        const SizedBox(height: 12),

        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          username,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Level $level • $xp XP',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}