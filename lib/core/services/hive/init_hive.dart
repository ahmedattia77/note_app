import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/data_base_constants/local_data_base_keys.dart';
import 'package:note_app/feature/create_profile/data/model/user_model.dart';
import 'package:note_app/feature/home/data/model/task_model.dart';

class InitHive {
  static Future<void> initialHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<UserModel>(LocalDataBaseKeys.userKey);
    await Hive.openBox<TaskModel>(LocalDataBaseKeys.tasksKey);
  }
}
