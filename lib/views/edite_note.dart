import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_button.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

import '../widgets/custom_app_bar.dart';

class EditeNote extends StatelessWidget {
  const EditeNote({super.key});

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
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                hintText: 'Title',
                labelText: 'Title',
                textColor: Colors.black,
                hintColor: Colors.grey,
                labelColor: Colors.grey,
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                hintText: 'Content',
                labelText: 'Content',
                textColor: Colors.black,
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
