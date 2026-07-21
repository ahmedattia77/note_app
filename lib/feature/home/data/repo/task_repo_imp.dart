import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/data_base_constants/local_data_base_keys.dart';
import 'package:note_app/feature/home/data/repo/task_repo.dart';



class TaskRepositoryImpl implements TaskRepository {
  final Box<TaskModel> _taskBox = Hive.box<TaskModel>(
    LocalDataBaseKeys.tasksKey,
  );

  @override
  Future<List<TaskModel>> getTodayTasks() async {
    return _taskBox.values.toList();
  }

  @override
  Future<void> addTask(TaskModel task) async {
    await _taskBox.put(task.id, task);
  }
  
}
