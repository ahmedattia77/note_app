import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/data_base_constants/local_data_base_keys.dart';
import 'package:note_app/feature/create_profile/data/model/user_model.dart';
import 'package:note_app/feature/create_profile/data/repository/save_user_repo.dart';
import 'package:note_app/feature/create_profile/data/use_case/save_user_use_case.dart';
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
  late final SaveUserRepository _saveUserRepository;
  late final SaveUserUseCase _saveUserUseCase;

  TextEditingController _nameTextEditingController = TextEditingController();
  XFile? _image;
  bool _isLoading = false;

  @override
  void initState() {
    _saveUserRepository = SaveUserRepository();
    _saveUserUseCase = SaveUserUseCase(_saveUserRepository);

    super.initState();
  }

  final picker = ImagePicker();

  void _takeCameraImage(BuildContext context) async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    pickedImage != null
        ? setState(() {
            _image = pickedImage;
          })
        : '';
    if (context.mounted) Navigator.pop(context);
  }

  void _takeGallaryImage(BuildContext context) async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    pickedImage != null
        ? setState(() {
            _image = pickedImage;
          })
        : '';
    if (context.mounted) Navigator.pop(context);
  }

  void saveData() async {
    final userBox = Hive.box<UserModel>(LocalDataBaseKeys.userKey);

    final user = UserModel(
      name: _nameTextEditingController.text,
      image: _image!.path,
    );

    await userBox.add(user);
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImage(
                  image: _image != null ? File(_image!.path) : null,
                  onTab: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
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
                NameTextField(
                  hintText: 'Ahmed Attia',
                  textEditingController: _nameTextEditingController,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.widthOf(context),
                  height: 50,
                  child: FilledButton(
                    onPressed: () async {
                      if (_nameTextEditingController.text.trim().isEmpty ||
                          _image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'pls set an image and name',
                            ),
                          ),
                        );
                        return;
                      }
                      try {
                        await _saveUserUseCase.call(
                          _nameTextEditingController.text.trim(),
                          _image!.path,
                        );

                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('error: $e')),
                          );
                        }
                      }
                    },
                    child: Text("Continue"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
