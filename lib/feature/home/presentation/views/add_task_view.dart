import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mtodo_app/feature/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/manager/display_note_cubit/display_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/add_note_form.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/add_task_header.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
        backgroundColor: Color(0XFFF1F5F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddTaskHeader(
                titleBar: 'Add New Task',
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                    if (state is AddNoteFailure) {
                      print("Note or task wasn't added! ${state.errMessage}");
                    }
                    if (state is AddNoteSuccess) {
                      BlocProvider.of<DisplayNoteCubit>(context).displayNote();
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return ModalProgressHUD(
                        inAsyncCall: state is AddNoteLoading ? true : false,
                        child: AddNoteForm());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
