
import 'package:note_app/feature/home/data/model/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTodayTasks();

  Future<void> addTask(TaskModel task);
}