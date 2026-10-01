import 'package:flutter/material.dart';
import '../models/user_data.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${dummyUser.streak.value} Hari Streak! Pertahankan apimu!')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_fire_department_rounded, color: Colors.orange.shade600),
              const SizedBox(width: 4),
              ValueListenableBuilder<int>(
                valueListenable: dummyUser.streak,
                builder: (context, streakValue, child) {
                  return Text(
                    '$streakValue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange.shade700,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}