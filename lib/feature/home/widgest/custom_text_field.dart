import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:  AppTextStyl.hintHeadLineTextStyle.copyWith(
              color: Colors.grey ,
              fontSize: 16,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}