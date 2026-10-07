import 'package:flutter/material.dart';
import '../models/user_data.dart';

class XPCard extends StatelessWidget {
  const XPCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Total XP kamu: ${dummyUser.xp.value} XP')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bolt_rounded, color: Colors.blue.shade500),
              const SizedBox(width: 4),
              ValueListenableBuilder<int>(
                valueListenable: dummyUser.xp,
                builder: (context, xpValue, child) {
                  return Text(
                    '$xpValue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue.shade700,
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