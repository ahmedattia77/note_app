import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/feature/create_profile/presentation/widgets/add_name_text.dart';
import 'package:note_app/feature/create_profile/presentation/widgets/create_prifile_text.dart';
import 'package:note_app/feature/create_profile/presentation/widgets/full_name_text.dart';
import 'package:note_app/feature/create_profile/presentation/widgets/name_text_field.dart';
import 'package:note_app/feature/create_profile/presentation/widgets/profile_image.dart';
import 'package:note_app/feature/create_profile/presentation/widgets/resource_dialog.dart';
import 'package:note_app/feature/home/pages/home_screen.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  XFile? image;

  final picker = ImagePicker();

  void _takeCameraImage(BuildContext context) async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    pickedImage != null
        ? setState(() {
            image = pickedImage;
          })
        : '';
    if (context.mounted) Navigator.pop(context);
  }

  void _takeGallaryImage(BuildContext context) async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    pickedImage != null
        ? setState(() {
            image = pickedImage;
          })
        : '';
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImage(
                image: image != null ? File(image!.path) : null,
                onTab: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true, // Click outside to close
                    builder: (BuildContext context) {
                      return ResourceDialog(
                        onCameraTab: () => _takeCameraImage(context),
                        onGalleryaTab: () => _takeGallaryImage(context),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              CreatePrifileText(),
              const SizedBox(height: 6),
              AddNameText(),
              const SizedBox(height: 30),
              Align(alignment: Alignment.centerLeft, child: FullNameText()),
              const SizedBox(height: 6),
              NameTextField(hintText: 'Ahmed Attia'),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.widthOf(context),
                height: 50,
                child: FilledButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
