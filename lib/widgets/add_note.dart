import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Title',
            labelText: 'Title',
            textColor: Colors.black,
            hintColor: Colors.grey,
            labelColor: Colors.grey,
            focusedBorderColor: Colors.blue,
            maxLines: 1,
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            hintText: 'Content',
            labelText: 'Content',
            textColor: Colors.black,
            hintColor: Colors.grey,
            labelColor: Colors.grey,
            focusedBorderColor: Colors.blue,
            maxLines: 5,
          ),
         Spacer(),
          CustomElevButton(
            height: 50,
            onPressed: () {},
            buttonName: 'Add',
          ),

        ],
      ),
    );
  }
}
