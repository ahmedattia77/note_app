
import 'package:flutter/material.dart';
import 'package:note_app/feature/home/data/model/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTodayTasks();
}

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<List<TaskModel>> getTodayTasks() async {
    await Future.delayed(const Duration(milliseconds: 200)); 
    
    return [
      const TaskModel(
        id: '1',
        title: 'Flutter UI',
        subtitle: 'Build Register Screen',
        status: 'Pending',
        leadingColor: Color(0xFF2196F3),
      ),
      const TaskModel(
        id: '2',
        title: 'Workout',
        subtitle: 'Gym at 6 PM',
        status: 'Done',
        leadingColor: Color(0xFF4CAF50),
      ),
      const TaskModel(
        id: '3',
        title: 'Meeting',
        subtitle: 'Team Sync',
        status: 'In Progress',
        leadingColor: Color(0xFFFF9800),
      ),
      const TaskModel(
        id: '4',
        title: 'Read Book',
        subtitle: 'Atomic Habits',
        status: 'Pending',
        leadingColor: Color(0xFF9C27B0),
      ),
    ];
  }
}