import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodo_app/core/utils/app_images.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/core/widgets/custom_TextField.dart';
import 'package:mtodo_app/core/widgets/custom_button.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';
import 'package:mtodo_app/feature/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/add_category_widgets.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task Title',
            style: AppStyles.styleBold30(context)
                .copyWith(fontSize: 18, color: Colors.black),
          ),
          CustomTextField(
            hintText: 'Task Title',
            onSaved: (value) {
              title = value;
            },
          ),
          AddCategoryWidgets(),
          Text(
            'Notes',
            style: AppStyles.styleBold30(context)
                .copyWith(fontSize: 18, color: Colors.black),
          ),
          CustomTextField(
            maxLines: 5,
            hintText: 'Notes',
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.12,
          ),
          CustomButon(
            text: 'Save',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var taskModel = TaskModel(
                    catImage: Assets.imageCatTask, title: title!, subTitle: subTitle!);
                BlocProvider.of<AddNoteCubit>(context).addNote(taskModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          SizedBox(
           height: 16,
          ),
        ],
      ),
    );
  }
}
