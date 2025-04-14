import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/feature/home/presentation/manager/display_note_cubit/display_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/task_list.dart';

class CompleteAndUncopleteTasks extends StatelessWidget {
  const CompleteAndUncopleteTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNoteCubit, DisplayNoteState>(
      builder: (context, state) {
        if (state is DisplayNoteInitial){
          return Center(
            child: Text(
              "Nothing to do... for now! 📝",
              style: AppStyles.styleSemiBold16(context).copyWith(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          );
        }
       else if (state is DisplaySuccess) {
          final allTasks = state.notes;
          final completedTasks =
              allTasks.where((task) => !task.isCompleted).toList(); 
          final unCompletedTasks = allTasks
              .where((task) => task.isCompleted)
              .toList();  
              if(completedTasks .isEmpty && unCompletedTasks.isEmpty){
                return Center(
                  child: Text(
                    "Nothing to do... for now! 📝",
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                );
              }  
          return Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                TaskList(tasks: completedTasks),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                SliverToBoxAdapter(
                    child: Text("Completed",
                        style: AppStyles.styleSemiBold16(context).copyWith(
                          color: Colors.black,
                          fontSize: 20,
                        ))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                TaskList(tasks: unCompletedTasks),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}