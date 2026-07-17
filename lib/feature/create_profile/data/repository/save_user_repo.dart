
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/data_base_constants/local_data_base_keys.dart';
import 'package:note_app/feature/create_profile/data/model/user_model.dart';
import 'package:hive/hive.dart';

class SaveUserRepository {
  final Box<UserModel> _userBox = Hive.box<UserModel>(LocalDataBaseKeys.userKey);

  Future<void> saveUserData({required String userName, required String path}) async {
    final user = UserModel(
      name: userName,
      image: path,
    );
    await _userBox.add(user);
  }
}