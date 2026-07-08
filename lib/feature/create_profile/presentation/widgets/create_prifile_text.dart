import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';

class CreatePrifileText extends StatelessWidget {
  const CreatePrifileText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Create Your Profile",
      style: AppTextStyl.largHeadLineTextStyle,
    );
  }
}
