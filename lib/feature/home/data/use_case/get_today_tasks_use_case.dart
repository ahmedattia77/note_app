import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:note_app/feature/home/data/repo/task_repo.dart';

typedef HomeTasksData = ({
  List<TaskModel> tasks,
  int totalCount,
  int pendingCount,
  int doneCount,
  int inProgressCount
});

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<HomeTasksData> call() async {
    final List<TaskModel> tasks = await repository.getTodayTasks();

    int totalCount = 0;
    int pendingCount = 0;
    int doneCount = 0;
    int inProgressCount = 0;

    totalCount = tasks.length;
    pendingCount = tasks.where((t) => t.status == 'Pending').length;
    doneCount = tasks.where((t) => t.status == 'Done').length;
    inProgressCount = tasks.where((t) => t.status == 'In Progress').length;

    return (
      tasks: tasks,
      totalCount: totalCount,
      pendingCount: pendingCount,
      doneCount: doneCount,
      inProgressCount: inProgressCount,
    );
  }
}
