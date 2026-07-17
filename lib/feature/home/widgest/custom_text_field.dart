import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  // 1. ضيف السطر ده عشان تستقبل الـ validator
  final String? Function(String?)? validator; 

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.validator, // 2. ضيفه هنا كـ Optional parameter
  });

  @override
  Widget build(BuildContext context) {
    // 3. اتأكد إن الـ Widget اللي بتستخدمها جوه هي TextFormField مش TextField
    return TextFormField( 
      controller: controller,
      maxLines: maxLines,
      validator: validator, // 4. مرره هنا للـ TextFormField
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}