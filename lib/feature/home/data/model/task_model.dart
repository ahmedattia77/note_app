import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String subtitle;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final int leadingColorValue;

  @HiveField(5)
  final DateTime date;

  @HiveField(6)
  final List<String> images;

  TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.leadingColorValue,
    required this.date,
    required this.images,
  });

  Color get leadingColor => Color(leadingColorValue);

  Color get statusColor {
    switch (status) {
      case 'Done':
        return const Color(0xFF4CAF50);
      case 'In Progress':
        return const Color(0xFFFF9800);
      case 'Pending':
      default:
        return const Color(0xFF2196F3);
    }
  }

  Color get statusBgColor {
    switch (status) {
      case 'Done':
        return const Color(0xFFE8F5E9);
      case 'In Progress':
        return const Color(0xFFFFF3E0);
      case 'Pending':
      default:
        return const Color(0xFFE3F2FD);
    }
  }
}