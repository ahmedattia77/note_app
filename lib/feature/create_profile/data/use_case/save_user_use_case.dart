

import 'package:note_app/feature/create_profile/data/repository/save_user_repo.dart';

class SaveUserUseCase {
  final SaveUserRepository repository;

  SaveUserUseCase(this.repository);

  Future<void> call(String userName, String path) async {
    await repository.saveUserData(userName: userName, path: path);
  }
}