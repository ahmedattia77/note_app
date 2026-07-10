import 'package:note_app/feature/home/data/model/home_task_data.dart';
import 'package:note_app/feature/home/data/repo/task_repo.dart';

class GetTodayTasksUseCase {
  final TaskRepository repository;

  const GetTodayTasksUseCase(this.repository);

  Future<HomeTasksData> call() async {
    final homeData = await repository.getTodayTasks();
    final totalCount = homeData.length;

    final doneCount = homeData.where((task) => task.status == 'Done').length;
    final pendingCount = homeData
        .where((task) => task.status == 'Pending')
        .length;

    return HomeTasksData(
      allTasks: homeData,
      totalCount: totalCount,
      doneCount: doneCount,
      pendingCount: pendingCount,
    );
  }
}
