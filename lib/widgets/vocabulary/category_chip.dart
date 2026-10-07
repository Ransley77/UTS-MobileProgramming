import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          label == 'Favorit' ? '❤ Favorit' : label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.orange),
        ),
        selected: isSelected,
        selectedColor: Colors.orange,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.orange),
        onSelected: onSelected,
      ),
    );
  }
}
