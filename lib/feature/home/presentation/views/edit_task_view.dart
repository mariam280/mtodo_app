import 'package:flutter/material.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1F5F9),
      body: EditTaskViewBody(
        taskModel: taskModel,
      ),
    );
  }
}
