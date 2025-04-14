part of 'display_note_cubit.dart';

@immutable
sealed class DisplayNoteState {}

final class DisplayNoteInitial extends DisplayNoteState {}

final class DisplaySuccess extends DisplayNoteState {
  final List<TaskModel> notes;

  DisplaySuccess(this.notes);
}

final class DisplayFailure extends DisplayNoteState {
  final String errMessage;

  DisplayFailure(this.errMessage);
}
