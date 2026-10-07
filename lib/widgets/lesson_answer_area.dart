import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonAnswerArea extends StatelessWidget {
  final Lesson lesson;
  final String? selectedAnswer;
  final bool isAnswerChecked;
  final ValueChanged<String?> onAnswerSelected;
  final TextEditingController typeController;
  final List<String> selectedWords;
  final ValueChanged<String> onWordTapped;
  final VoidCallback? onPlayAudio;

  const LessonAnswerArea({
    super.key,
    required this.lesson,
    required this.selectedAnswer,
    required this.isAnswerChecked,
    required this.onAnswerSelected,
    required this.typeController,
    required this.selectedWords,
    required this.onWordTapped,
    this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    switch (lesson.type) {
      case TipeSoal.pilihanganda:
        return _buildPilihanGanda();
      case TipeSoal.ketikkan:
        return _buildKetikkan();
      case TipeSoal.susunkata:
        return _buildSusunKata();
      case TipeSoal.dengarkata:
        return _buildDengarKata();
    }
  }

  Widget _buildDengarKata() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onPlayAudio,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.lightBlue, width: 2),
              ),
              child: const Icon(Icons.volume_up_rounded, size: 48, color: Colors.lightBlue),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Ketuk untuk mendengarkan",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          _buildPilihanGanda(),
        ],
      ),
    );
  }

  Widget _buildPilihanGanda() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lesson.options.length,
      itemBuilder: (context, index) {
        String option = lesson.options[index];
        bool isSelected = selectedAnswer == option;
        
        bool isCorrectOption = option.toLowerCase() == lesson.correctAnswer.toLowerCase();

        Color backgroundColor = Colors.white;
        Color borderColor = Colors.grey.shade300;
        Color textColor = Colors.black87;

        if (isAnswerChecked) {
          if (isCorrectOption) {
            backgroundColor = const Color(0xFFD7FBE8);
            borderColor = const Color(0xFF58CC02);
            textColor = const Color(0xFF2B7A0B);
          } else if (isSelected) {
            backgroundColor = const Color(0xFFFFDFE0);
            borderColor = const Color(0xFFFF4B4B);
            textColor = const Color(0xFF9E1A1A);
          } else {
            backgroundColor = Colors.white;
            borderColor = Colors.grey.shade300;
            textColor = Colors.black54;
          }
        } else {
          if (isSelected) {
            backgroundColor = const Color(0xFFDDF4FF);
            borderColor = const Color(0xFF1CB0F6);
            textColor = const Color(0xFF0077B6);
          }
        }

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: isAnswerChecked ? null : () => onAnswerSelected(option),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildKetikkan() {
    return Column(
      children: [
        TextField(
          controller: typeController,
          enabled: !isAnswerChecked,
          onChanged: (text) => onAnswerSelected(text.trim()),
          decoration: InputDecoration(
            hintText: 'Ketikkan jawaban Anda...',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSusunKata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 60),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedWords.map((word) {
              return InputChip(
                label: Text(word, style: const TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                onDeleted: isAnswerChecked ? null : () => onWordTapped(word),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: lesson.options.map((word) {
            bool isUsed = selectedWords.contains(word);
            return ActionChip(
              label: Text(word, style: TextStyle(color: isUsed ? Colors.transparent : Colors.black)),
              backgroundColor: isUsed ? Colors.grey.shade200 : Colors.white,
              elevation: isUsed ? 0 : 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: isUsed ? Colors.transparent : Colors.grey.shade300),
              ),
              onPressed: (isUsed || isAnswerChecked) ? null : () => onWordTapped(word),
            );
          }).toList(),
        ),
      ],
    );
  }
}