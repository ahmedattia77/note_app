import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileImage extends StatelessWidget {
  final VoidCallback onTab;
  final File? image;
  const ProfileImage({super.key , required this.onTab ,this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTab(),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: 
          image != null ?
          Image.file( 
            image!,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: child,
              );
            },
          ): Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white70
            ),
            child: Icon(Icons.person_off_outlined)),
        ),
      ),
    );
  }
}
