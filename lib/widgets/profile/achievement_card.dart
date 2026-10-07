import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool unlocked;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: unlocked
                  ? const Color(0xFFFFE0B2)
                  : Colors.grey.shade200,
              child: Icon(
                icon,
                color: unlocked
                    ? Colors.orange
                    : Colors.grey,
                size: 30,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}