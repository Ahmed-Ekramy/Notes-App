import 'package:flutter/material.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widgets/custom_button.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

import '../cubit/task_cubit.dart';
import '../widgets/custom_app_bar.dart';

class EditeNote extends StatelessWidget {
  EditeNote({super.key, required this.noteModel});

  final NoteModel noteModel;
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 20),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Edite Note',
                icon: Icon(Icons.check, size: 30),
                onTap: () {
                  noteModel.title = title?? noteModel.title;
                  noteModel.description = content?? noteModel.description;
                  noteModel.save();
                  TaskCubit.get(context).getTask();
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                onChanged: (value) {
                  title = value;
                },
                hintText: noteModel.title,
                textColor: Colors.white,
                hintColor: Colors.grey,
                labelColor: Colors.grey,
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                onChanged: (value) {
                  content = value;
                },
                hintText:  noteModel.description,
                textColor: Colors.white,
                hintColor: Colors.grey,
                labelColor: Colors.grey,
                maxLines: 5,
              ),
              Spacer(),
              CustomElevButton(
                height: 50,
                width: double.infinity,
                onPressed: () {},
                buttonName: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
