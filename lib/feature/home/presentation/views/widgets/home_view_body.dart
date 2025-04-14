import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodo_app/core/widgets/custom_button.dart';
import 'package:mtodo_app/feature/home/presentation/manager/display_note_cubit/display_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/add_task_view.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/complete_and_uncoplete_tasks.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/home_view_header.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<DisplayNoteCubit>(context).displayNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            HomeViewHeader(),
            Expanded(
              child: Transform.translate(
                  offset: Offset(0, -80), child: CompleteAndUncopleteTasks()),
            ),
          ],
        ),
        Positioned(
            bottom: 20,
            left: 18,
            right: 18,
            child: CustomButon(
              text: 'Add New Task',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddTaskView();
                }));
              },
            ))
      ],
    );
  }
}


/**
  
  class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            HomeViewHeader(),
            Expanded(
              child: Transform.translate(
                  offset: Offset(0, -80), child: CompleteAndUncopleteTasks()),
            ),
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomButon(
                  text: 'Add New Task',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return AddTaskView();
                    }));
                  },
                ),
              ),
            )*/
          ],
        ),
        Positioned(
          bottom: 20, 
      left: 18,
      right: 18,
          child: CustomButon(
            text: 'Add New Task',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddTaskView();
              }));
            },
          ))
      ],
    );
  }
}


 */