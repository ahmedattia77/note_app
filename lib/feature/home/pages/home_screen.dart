import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/core/colors/app_colors.dart';
import 'package:note_app/core/data_base_constants/local_data_base_keys.dart';
import 'package:note_app/feature/create_profile/data/model/user_model.dart';
import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:note_app/feature/home/data/repo/task_repo_imp.dart';
import 'package:note_app/feature/home/data/use_case/get_today_tasks_use_case.dart';
import 'package:note_app/feature/home/pages/add_task.dart';
import 'package:note_app/feature/home/widgest/custom_appbar.dart';
import 'package:note_app/feature/home/widgest/task_item_list.dart';
import 'package:note_app/feature/home/widgest/task_summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GetTasksUseCase _getTodayTasks;

  @override
  void initState() {
    super.initState();
    _getTodayTasks = GetTasksUseCase(TaskRepositoryImpl());
  }

  UserModel? getUserinfo() {
    final userBox = Hive.box<UserModel>(LocalDataBaseKeys.userKey);
    if (userBox.isEmpty) return null;
    return userBox.getAt(0);
  }

  void _navigateToAddTask({TaskModel? taskToEdit}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTask(taskToEdit: taskToEdit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = getUserinfo();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
        onPressed: () => _navigateToAddTask(),
        backgroundColor: Colors.indigo,
        label: const Row(
          children: [
            Icon(Icons.add, color: Colors.white),
            SizedBox(width: 6),
            Text("Add Task", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder<Box<TaskModel>>(
          valueListenable: Hive.box<TaskModel>(LocalDataBaseKeys.tasksKey).listenable(),
          builder: (context, box, _) {
            return FutureBuilder<HomeTasksData>(
              key: const ValueKey('today_tasks_future'),
              future: _getTodayTasks(),
              builder: (context, snapshot) {
                if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }

                final homeTasksData = snapshot.data;
                if (homeTasksData == null) return const SizedBox();

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      if (user != null) CustomAppBar(user: user),
                      const SizedBox(height: 25),
                      
                      TaskSummaryCard(
                        tasksCount: homeTasksData.totalCount,
                        pendingCount: homeTasksData.pendingCount,
                        doneCount: homeTasksData.doneCount,
                        inProgressCount: homeTasksData.inProgressCount,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Today's Tasks",
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      homeTasksData.tasks.isEmpty
                          ? Center(
                              child: Lottie.asset(
                                height: 250,
                                width: 250,
                                'assets/lottie/no_result_found.json',
                              ),
                            )
                          : Expanded(
                              child: TaskItemList(
                                tasks: homeTasksData.tasks,
                                onTaskTap: (task) {
                                  _navigateToAddTask(taskToEdit: task);
                                },
                              ),
                            ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}