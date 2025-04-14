import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/core/widgets/custom_TextField.dart';
import 'package:mtodo_app/core/widgets/custom_button.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';
import 'package:mtodo_app/feature/home/presentation/manager/display_note_cubit/display_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/add_task_header.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/edit_category_widgets.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AddTaskHeader(
            titleBar: 'Edit Task',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Title',
                  style: AppStyles.styleBold30(context)
                      .copyWith(fontSize: 18, color: Colors.black),
                ),
                CustomTextField(
                  hintText: widget.taskModel.title,
                  onChange: (value) {
                    title = value;
                  },
                ),
                EditCategoryWidgets(
                  taskModel: widget.taskModel,
                ),
                Text(
                  'Notes',
                  style: AppStyles.styleBold30(context)
                      .copyWith(fontSize: 18, color: Colors.black),
                ),
                CustomTextField(
                  maxLines: 5,
                  hintText: widget.taskModel.subTitle,
                  onChange: (value) {
                    subTitle = value;
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.12,
                ),
                CustomButon(
                  text: 'Edit',
                  onTap: () {
                    widget.taskModel.title = title ?? widget.taskModel.title;
                    widget.taskModel.subTitle =
                        subTitle ?? widget.taskModel.subTitle;
                    widget.taskModel.save();
                    BlocProvider.of<DisplayNoteCubit>(context).displayNote();
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                 height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
