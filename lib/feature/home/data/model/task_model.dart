
import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final String subtitle;
  final String status; 
  final Color leadingColor;

  const TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.leadingColor,
  });

  Color get statusColor {
    switch (status) {
      case 'Done': return const Color(0xFF4CAF50);
      case 'In Progress': return const Color(0xFFFF9800);
      case 'Pending':
      default: return const Color(0xFF2196F3);
    }
  }

  Color get statusBgColor {
    switch (status) {
      case 'Done': return const Color(0xFFE8F5E9);
      case 'In Progress': return const Color(0xFFFFF3E0);
      case 'Pending':
      default: return const Color(0xFFE3F2FD);
    }
  }
}