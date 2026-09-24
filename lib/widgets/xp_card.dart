import 'package:flutter/material.dart';

class XPCard extends StatelessWidget {
  const XPCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.bolt, color: Colors.amber, size: 28),
        SizedBox(width: 4),
        Text(
          '450',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}