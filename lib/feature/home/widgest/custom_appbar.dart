import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/feature/create_profile/data/model/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final UserModel user;
  const CustomAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          foregroundImage: FileImage(File(user.image)),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning 👋',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              user.name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 28,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
