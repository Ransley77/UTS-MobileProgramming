import 'package:flutter/material.dart';
import '../models/user_data.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.track_changes_rounded, color: Colors.orange.shade500, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Misi Harian',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Selesaikan ${dummyUser.dailyMissionTarget} Level',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: dummyUser.dailyMissionProgress,
              builder: (context, currentProgress, child) {
                return ValueListenableBuilder<bool>(
                  valueListenable: dummyUser.isDailyMissionClaimed,
                  builder: (context, isClaimed, child) {
                    bool isGoalReached = currentProgress >= dummyUser.dailyMissionTarget;

                    if (isClaimed) {
                      return Icon(Icons.check_circle_rounded, color: Colors.green.shade600, size: 40);
                    } else if (isGoalReached) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade500,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          dummyUser.isDailyMissionClaimed.value = true;
                          dummyUser.xp.value += 50; 
                          dummyUser.streak.value += 1;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Misi Diklaim! +50 XP & +1 Streak')),
                          );
                        },
                        child: const Text('Klaim'),
                      );
                    } else {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: currentProgress / dummyUser.dailyMissionTarget,
                              strokeWidth: 5,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                          ),
                          Text(
                            '$currentProgress/${dummyUser.dailyMissionTarget}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}