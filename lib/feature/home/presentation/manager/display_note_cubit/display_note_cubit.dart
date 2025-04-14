import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';

part 'display_note_state.dart';

class DisplayNoteCubit extends Cubit<DisplayNoteState> {
  DisplayNoteCubit() : super(DisplayNoteInitial());

  void displayNote() {
    emit(DisplayNoteInitial());
    var noteBox = Hive.box<TaskModel>(kNoteBox);
    emit(DisplaySuccess(noteBox.values.toList()));
  }

  void toggleTask(dynamic key) {
    var noteBox = Hive.box<TaskModel>(kNoteBox);
    var task = noteBox.get(key);

    if (task != null) {
      task.isCompleted = !task.isCompleted;
      noteBox.put(key, task);
      displayNote();
    }
  }

  void deleteNote(dynamic key) {
    var noteBox = Hive.box<TaskModel>(kNoteBox);
    noteBox.delete(key);
    displayNote();
  }
}
