part of 'task_cubit.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}
final class TaskLoading extends TaskState {}
final class TaskSuccess extends TaskState {
  final List<NoteModel> notes;
  TaskSuccess(this.notes);
}
final class TaskError extends TaskState{
  final String message;
  TaskError(this.message);
}
