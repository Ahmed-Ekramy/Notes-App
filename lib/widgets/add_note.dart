
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/add_task_cubit.dart';
import '../cubit/add_task_state.dart';
import '../cubit/task_cubit.dart';
import '../model/note_model.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    var currantDate=DateTime.now();
    var dateFormat= DateFormat('dd-MM-yyyy').format(currantDate);
    var cubit = AddTaskCubit.get(context);
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is AddTaskSuccess) {
          TaskCubit.get(context).getTask();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddTaskLoading ? true : false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 10,
              ),
              child: Form(
                autovalidateMode: cubit.autoValidateMode,
                key: cubit.formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        cubit.title = value;
                      },
                      hintText: 'Title',
                      labelText: 'Title',
                      textColor: Colors.white,
                      hintColor: Colors.grey,
                      labelColor: Colors.grey,
                      focusedBorderColor: Colors.blue,
                      maxLines: 1,
                    ),

                    SizedBox(height: 20),
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a content';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        cubit.content = value;
                      },
                      hintText: 'Content',
                      labelText: 'Content',
                      textColor: Colors.white,
                      hintColor: Colors.grey,
                      labelColor: Colors.grey,
                      focusedBorderColor: Colors.blue,
                      maxLines: 5,
                    ),
                    SizedBox(height: 20),
                    ColorList(),
                    SizedBox(height: 20),

                    CustomElevButton(
                      isLoading: state is AddTaskLoading ? true : false,
                      height: 50,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.formKey.currentState!.save();
                          NoteModel noteModel = NoteModel(
                            title: cubit.title!,
                            description: cubit.content!,
                            date: dateFormat,
                            color: cubit.colors[cubit.indexColor!].value,
                          );
                          cubit.addTasks(noteModel);
                        } else {
                          cubit.changeAutoValidateMode();
                        }
                      },
                      buttonName: 'Add',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ColorItem extends StatelessWidget {
final  bool isSelected;
final Color color;
  const ColorItem(
      {
        required this.color,
        required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  isSelected?  CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 36,
        backgroundColor: color,

      ),
    ): CircleAvatar(
      radius: 38,
      backgroundColor: color);
  }
}
class ColorList extends StatelessWidget {
   ColorList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return
     SizedBox(
       height: 80,
       child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AddTaskCubit.get(context). colors.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: InkWell(
              onTap: (){
                AddTaskCubit.get(context).changeColor(index);
              },
              child: ColorItem(
                  color:  AddTaskCubit.get(context). colors[index],
                isSelected: AddTaskCubit.get(context).indexColor==index,
              ),
            ),
          ),
        ),
     );
  }
}
