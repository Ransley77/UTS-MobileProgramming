import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/progress_card.dart';
import '../widgets/daily_goal_card.dart';
import '../widgets/lesson_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomHeader(),
            const SizedBox(height: 70),
            const ProgressCard(),
            const DailyGoalCard(),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 20, bottom: 10),
              child: Text(
                'Perjalananmu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const LessonPath(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}