import 'package:flutter/material.dart';
import '../widgets/streak_card.dart';
import '../widgets/xp_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quadra', 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.orange,
          ),
        ),
        actions: const [
          StreakCard(),
          SizedBox(width: 16),
          XPCard(),
          SizedBox(width: 16),
        ],
      ),
      body: const Center(
        child: Text('...'),
      ),
    );
  }
}