import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  final int tasksCount;
  final int doneCount;
  final int pendingCount;
  const TaskSummaryCard({
    super.key,
    required this.doneCount,
    required this.pendingCount,
    required this.tasksCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF3F51B5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(count: tasksCount, label: 'Tasks'),
          _SummaryItem(count: doneCount, label: 'Pending'),
          _SummaryItem(count: pendingCount, label: 'Done'),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final int count;
  final String label;

  const _SummaryItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}
