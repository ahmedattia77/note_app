import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TaskImagesPicker extends StatelessWidget {
  final List<String> images;
  final VoidCallback onImagesChanged;

  const TaskImagesPicker({
    super.key,
    required this.images,
    required this.onImagesChanged,
  });

  Future<void> _pickMultipleImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      images.addAll(pickedFiles.map((file) => file.path));
      onImagesChanged();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Attachments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E1E1E),
              ),
            ),
            TextButton.icon(
              onPressed: _pickMultipleImages,
              icon: const Icon(
                Icons.add_photo_alternate,
                color: Color(0xFF53639B),
              ),
              label: const Text(
                'Add Images',
                style: TextStyle(
                  color: Color(0xFF53639B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (images.isNotEmpty)
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(images[index]),
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {
                          images.removeAt(index);
                          onImagesChanged();
                        },
                        child: const CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.black54,
                          child: Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
            ),
            child: const Center(
              child: Text(
                'No images added yet',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
      ],
    );
  }
}
