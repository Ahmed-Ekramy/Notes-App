import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../model/note_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  static TaskCubit get(context) => BlocProvider.of(context);
  List<NoteModel>? notes;
   void getTask() {
      var noteBox = Hive.box<NoteModel>('notes');
      notes = noteBox.values.toList();
      emit(TaskSuccess(notes!));
  }
}
