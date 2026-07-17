import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:note_app/feature/home/data/repo/task_repo.dart';

class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> call(TaskModel task) async {
    await repository.addTask(task);
  }
}