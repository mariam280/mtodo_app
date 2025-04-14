import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_images.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
 
 String categoryImage = Assets.imageCatTask;
  addNote(TaskModel task) {
    task.catImage= categoryImage;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<TaskModel>(kNoteBox);
      noteBox.add(task);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}


/**
 * class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
 
 String category = Assets.imageCatTask;
  addNote(TaskModel task) {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<TaskModel>(kNoteBox);
      noteBox.add(task);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
 */
