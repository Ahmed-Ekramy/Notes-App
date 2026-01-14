import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/model/note_model.dart';

import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? content;
  int? indexColor;
  final List<Color> colors=[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.grey,
  ];

  void changeColor(int index){
    indexColor=index;
    emit(ChangeColor());
  }
  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateMode());
  }

  Future<void> addTasks(NoteModel noteModel) async{
    emit(AddTaskLoading());
    try{
      var noteBox = Hive.box<NoteModel>('notes');
      await noteBox.add(noteModel);
      emit(AddTaskSuccess());
    }catch (e){
      emit(AddTaskError(e.toString()));
      print(e.toString());
    }
  }
}
