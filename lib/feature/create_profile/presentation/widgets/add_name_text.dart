import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';

class AddNameText extends StatelessWidget {
  const AddNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "add your name and profile picture",
      style: AppTextStyl.hintHeadLineTextStyle,
    );
  }
}
