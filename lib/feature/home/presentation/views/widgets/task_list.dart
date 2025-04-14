import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodo_app/core/functions/show_dialog.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';
import 'package:mtodo_app/feature/home/presentation/manager/display_note_cubit/display_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/edit_task_view.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/task_Item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: Color(0xffFFFFFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () {
                showConfirmDialog(
                    context: context,
                    onEdit: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditTaskView(taskModel: tasks[index],);
                      }));
                    },
                    onDelete: ()=>context.read<DisplayNoteCubit>().deleteNote(tasks[index].key),);
              },
              child: TaskItem(
                taskModel: tasks[index],
                onChanged: (_) => context.read<DisplayNoteCubit>().toggleTask(tasks[index].key),
              ),
            ),
          ),
        );
      },
    );
  }
}




/*
class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks, required this.onTaskToggled});
  final List<TaskModel> tasks;
  final Function(TaskModel) onTaskToggled;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: Color(0xffFFFFFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditTaskView();
                }));
              },
              child: TaskItem(
                taskModel: tasks[index],
                onChanged: (value) => onTaskToggled(tasks[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}

*/