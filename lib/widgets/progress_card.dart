import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: AnimatedBuilder(
        animation: Listenable.merge([dummyUser.currentLanguage, dummyUser.xp]),
        builder: (context, child) {
          final String currentLang = dummyUser.currentLanguage.value;
          final activeLangData = dummyUser.languages[currentLang]!;
          final progress = activeLangData.progressPercentage;

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          activeLangData.unitTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TweenAnimationBuilder<double>(
                    key: ValueKey(currentLang),
                    tween: Tween<double>(begin: 0.0, end: progress),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: value,
                          minHeight: 12,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    activeLangData.unitDescription,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}