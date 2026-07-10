import 'package:flutter/material.dart';
import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:note_app/feature/home/widgest/task_card.dart';

class TaskItemList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskItemList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(child: Text("No tasks for today"));
    }

    return ListView.builder(
      itemCount: tasks.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return TaskCard(task: tasks[index]);
      },
    );
  }
}