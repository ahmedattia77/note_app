
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final String hintText;
  final Iterable<String>? autofillHints;
  final TextEditingController textEditingController; 

  const NameTextField({
    super.key,
    required this.hintText,
    this.autofillHints,
    required this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white70
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: textEditingController,
          keyboardType:TextInputType.name ,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}