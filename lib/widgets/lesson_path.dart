import 'package:flutter/material.dart';
import '../models/user_data.dart';

class LessonPath extends StatelessWidget {
  const LessonPath({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dummyUser.lessons.length,
      itemBuilder: (context, index) {
        final lesson = dummyUser.lessons[index];
        
        Color buttonColor = Colors.grey.shade300;
        IconData iconData = Icons.lock_rounded;
        
        if (lesson.isCompleted) {
          buttonColor = Colors.orange.shade400;
          iconData = Icons.check_rounded;
        } else if (!lesson.isLocked) {
          buttonColor = Colors.orange.shade600;
          iconData = Icons.play_arrow_rounded;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: SizedBox(
              width: 70,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: const CircleBorder(),
                  elevation: lesson.isLocked ? 0.0 : 6.0,
                ),
                onPressed: lesson.isLocked 
                    ? null 
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Membuka level ${lesson.level}')),
                        );
                      },
                child: Icon(iconData, color: Colors.white, size: 32),
              ),
            ),
          ),
        );
      },
    );
  }
}