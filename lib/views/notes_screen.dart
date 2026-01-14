import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/add_task_cubit.dart';
import '../cubit/task_cubit.dart';
import '../widgets/add_note.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_list_notes.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            context: context,
            builder: (context) =>
                BlocProvider(
                  create: (context) => AddTaskCubit(),
                  child: AddNote(),
                ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Notes', icon: Icon(Icons.search, size: 30), onTap: () {  },),
            SizedBox(height: 5),
            CustomListNotes(),
          ],
        ),
      ),
    );
  }
}
