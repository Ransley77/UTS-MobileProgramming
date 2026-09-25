import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const Text('🇪🇸', style: TextStyle(fontSize: 36)), 
        title: const Text(
          'Bahasa Spanyol', 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: const Text('Level 1: Pemula'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange[700], size: 18),
        onTap: () {
        },
      ),
    );
  }
}