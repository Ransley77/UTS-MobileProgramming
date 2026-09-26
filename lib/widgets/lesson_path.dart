import 'package:flutter/material.dart';
import '../models/user_data.dart';

class LessonPath extends StatelessWidget {
  const LessonPath({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> zigzagOffsets = [0, 45, 75, 45, 0, -45, -75, -45];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dummyUser.lessons.length,
      itemBuilder: (context, index) {
        final lesson = dummyUser.lessons[index];
        final double offsetX = zigzagOffsets[index % zigzagOffsets.length];
        
        Color buttonColor = Colors.grey.shade300;
        IconData iconData = Icons.lock_rounded;
        double buttonSize = 70.0;
        
        if (lesson.isCompleted) {
          buttonColor = Colors.orange.shade400;
          iconData = Icons.check_rounded;
        } else if (!lesson.isLocked) {
          buttonColor = Colors.orange.shade600;
          iconData = Icons.star_rounded;
          buttonSize = 85.0;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Transform.translate(
            offset: Offset(offsetX, 0),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: offsetX >= 0 ? -45 : null,
                    right: offsetX < 0 ? -45 : null,
                    child: Text(
                      '${lesson.level}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: lesson.isLocked ? Colors.grey.shade300 : Colors.orange.shade300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: buttonSize,
                    height: buttonSize,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: const CircleBorder(),
                        elevation: lesson.isLocked ? 0.0 : 8.0,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: lesson.isLocked 
                          ? null 
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Memulai level ${lesson.level}...')),
                              );
                            },
                      child: Icon(
                        iconData, 
                        color: Colors.white, 
                        size: buttonSize * 0.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}