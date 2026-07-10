import 'package:flutter/material.dart';
import 'package:note_app/core/colors/add_task_colors.dart';

class ColorPickerList extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  ColorPickerList({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: AddTaskColors.colors.map((color) {
        final bool isSelected = selectedColor == color;
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
