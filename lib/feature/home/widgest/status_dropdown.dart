import 'package:flutter/material.dart';

class StatusDropdown extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const StatusDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> statuses = ['Pending', 'In Progress', 'Done'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
          isExpanded: true,
          style: const TextStyle(color: Color(0xFF1E1E1E), fontSize: 16),
          borderRadius: BorderRadius.circular(20),
          onChanged: onChanged,
          items: statuses.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}