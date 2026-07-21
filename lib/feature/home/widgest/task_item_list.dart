import 'package:flutter/material.dart';
import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:note_app/feature/home/widgest/task_card.dart';

class TaskItemList extends StatelessWidget {
  final List<TaskModel> tasks;
  final ValueChanged<TaskModel>? onTaskTap;

  const TaskItemList({
    super.key,
    required this.tasks,
    this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(child: Text("No tasks for today"));
    }

    return ListView.builder(
      itemCount: tasks.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final task = tasks[index];

        return Dismissible(
          key: ValueKey(task.key ?? index),
          direction: DismissDirection.endToStart,
          
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.delete_outline,
              color: Colors.white,
              size: 28,
            ),
          ),

          confirmDismiss: (direction) async {
            final taskTitle = task.title;

            await task.delete();

            if (context.mounted) {
              ScaffoldMessenger.of(context).clearSnackBars(); 
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Task "$taskTitle" deleted'),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            }

            return true;
          },

          child: TaskCard(
            task: task,
            onTap: () {
              if (onTaskTap != null) {
                onTaskTap!(task);
              }
            },
          ),
        );
      },
    );
  }
}