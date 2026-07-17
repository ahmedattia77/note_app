import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';
import 'package:note_app/feature/home/data/model/task_model.dart';
import 'package:note_app/feature/home/data/repo/task_repo_imp.dart';
import 'package:note_app/feature/home/data/use_case/add_task_use_case.dart';
import 'package:note_app/feature/home/widgest/color_picker.dart';
import 'package:note_app/feature/home/widgest/custom_text_field.dart';
import 'package:note_app/feature/home/widgest/status_dropdown.dart';
import 'package:note_app/feature/home/widgest/task_images_picker.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String _selectedStatus = 'Pending';
  Color _selectedColor = const Color(0xFF2196F3); 
  
  final List<String> _selectedImages = [];
  
  late final AddTaskUseCase _addTaskUseCase;

  @override
  void initState() {
    super.initState();
    _addTaskUseCase = AddTaskUseCase(TaskRepositoryImpl());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    final String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

    final newTask = TaskModel(
      id: uniqueId,
      title: _titleController.text.trim(),
      subtitle: _descController.text.trim(),
      status: _selectedStatus,
      leadingColorValue: _selectedColor.value,
      date: DateTime.now(), 
      images: _selectedImages,
    );

    await _addTaskUseCase(newTask);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Title',
                  style: AppTextStyl.hintHeadLineTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _titleController,
                  hintText: 'title...',
                  maxLines: 1,
                  validator: (value) => value == null || value.trim().isEmpty 
                      ? 'Title is required' 
                      : null,
                ),
                const SizedBox(height: 30),
                Text(
                  'Description',
                  style: AppTextStyl.hintHeadLineTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _descController,
                  hintText: 'Task Description...',
                  maxLines: 5,
                  validator: (value) => value == null || value.trim().isEmpty 
                      ? 'Description is required' 
                      : null,
                ),
                
                const SizedBox(height: 30),
                
                const Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 10),
                StatusDropdown(
                  selectedValue: _selectedStatus,
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value!;
                    });
                  },
                ),
                const SizedBox(height: 24),
                
                const Text(
                  'Choose Color',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 14),
                ColorPickerList(
                  selectedColor: _selectedColor,
                  onColorSelected: (color) {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                ),
                const SizedBox(height: 24),

                TaskImagesPicker(
                  images: _selectedImages,
                  onImagesChanged: () {
                    setState(() {
                      
                    });
                  },
                ),
                
                const SizedBox(height: 40),
                
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _saveTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53639B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Save Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}