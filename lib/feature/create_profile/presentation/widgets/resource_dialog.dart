import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';

class ResourceDialog extends StatelessWidget {
  final VoidCallback onCameraTab;
  final VoidCallback onGalleryaTab;
  const ResourceDialog({
    super.key,
    required this.onCameraTab,
    required this.onGalleryaTab,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choos resource'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Camera", style: AppTextStyl.hintHeadLineTextStyle),
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () => onCameraTab(),
          ),
          Text("Gallary", style: AppTextStyl.hintHeadLineTextStyle),
          IconButton(
            icon: Icon(Icons.image_outlined),
            onPressed: () => onGalleryaTab(),
          ),
        ],
      ),
    );
    ;
  }
}
