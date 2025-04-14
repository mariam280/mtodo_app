import 'package:flutter/material.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.taskModel, this.onChanged});
  final TaskModel taskModel;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: Image.asset(taskModel.catImage),
          title: Text(taskModel.title,style: AppStyles.styleSemiBold16(context).copyWith(
            fontSize: 20,
            decoration: taskModel.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              color: taskModel.isCompleted ? Colors.grey : Colors.black,
          ),),
          subtitle: Text(taskModel.subTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.styleSemiBold16(context).copyWith(
            decoration: taskModel.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              color: taskModel.isCompleted ? Colors.grey : Colors.black,
          ),),
          trailing: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: taskModel.isCompleted,
               onChanged: onChanged,
               side: BorderSide(
                color: kPrimaryColor,
                width: 1,
               ),)),
    );
  }
}
