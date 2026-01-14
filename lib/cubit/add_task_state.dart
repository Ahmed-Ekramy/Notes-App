
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}
final class ChangeAutoValidateMode extends AddTaskState {}
final class AddTaskLoading extends AddTaskState{}
final class AddTaskSuccess extends AddTaskState{}
final class ChangeColor extends AddTaskState{}
final class AddTaskError extends AddTaskState{
  final String message;
  AddTaskError(this.message);
}