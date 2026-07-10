import 'package:flutter/material.dart';
import 'package:note_app/core/colors/app_colors.dart';
import 'package:note_app/feature/home/data/model/home_task_data.dart';
import 'package:note_app/feature/home/data/repo/task_repo.dart';
import 'package:note_app/feature/home/data/use_case/get_today_tasks_use_case.dart';
import 'package:note_app/feature/home/widgest/custom_appbar.dart';
import 'package:note_app/feature/home/widgest/task_item_list.dart';
import 'package:note_app/feature/home/widgest/task_summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GetTodayTasksUseCase _getTodayTasks;
  late final Future<HomeTasksData> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _getTodayTasks = GetTodayTasksUseCase(TaskRepositoryImpl());
    _tasksFuture = _getTodayTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        label: Text("Add Task", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: FutureBuilder<HomeTasksData>(
          future: _tasksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            }

            final homeTasksData = snapshot.data!;

            /// usecase for pending and done ???
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CustomAppBar(),
                  const SizedBox(height: 25),

                  TaskSummaryCard(
                    tasksCount: homeTasksData.totalCount,
                    pendingCount: homeTasksData.pendingCount,
                    doneCount: homeTasksData.doneCount,
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Today's Tasks",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  Expanded(child: TaskItemList(tasks: homeTasksData.allTasks)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
