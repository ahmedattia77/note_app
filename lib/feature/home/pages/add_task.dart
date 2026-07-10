import 'package:flutter/material.dart';
import 'package:note_app/core/styles/app_text_styl.dart';
import 'package:note_app/feature/home/widgest/color_picker.dart';
import 'package:note_app/feature/home/widgest/custom_text_field.dart';
import 'package:note_app/feature/home/widgest/status_dropdown.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String _selectedStatus = 'Pending';
  Color _selectedColor = const Color(0xFF2196F3); 

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Title',
                style: AppTextStyl.hintHeadLineTextStyle.copyWith(
                  fontWeight: .bold,
                ),
              ),
              
              const SizedBox(height: 10),
              CustomTextField(
                controller: _titleController,
                hintText: 'title...',
                maxLines: 1,
              ),
              const SizedBox(height: 30),
              Text(
                'Descreption',
                style: AppTextStyl.hintHeadLineTextStyle.copyWith(
                  fontWeight: .bold,
                ),
              ),
              
              const SizedBox(height: 10),
              CustomTextField(
                controller: _descController,
                hintText: 'Task Description...',
                maxLines: 5,
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
              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF53639B,
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
