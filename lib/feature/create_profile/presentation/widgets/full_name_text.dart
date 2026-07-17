


import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';

class FullNameText extends StatelessWidget {
  const FullNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Full Name" ,textAlign: TextAlign.center, style: AppTextStyl.blodHintHeadLineTextStyle,);
  }
}