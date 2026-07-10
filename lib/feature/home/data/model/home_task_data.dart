


import 'package:note_app/feature/home/data/model/task_model.dart';

class HomeTasksData {
  final List<TaskModel> allTasks;
  final int totalCount;
  final int doneCount;
  final int pendingCount;

  const HomeTasksData({
    required this.allTasks,
    required this.totalCount,
    required this.doneCount,
    required this.pendingCount,
  });
}