import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.labelColor = Colors.grey,
    this.cursorColor = Colors.blue,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.errorBorderColor = Colors.red,
    this.backgroundColor, this.maxLines, this.onSaved,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;



  // 🎨 Colors
  final Color textColor;
  final Color hintColor;
  final Color labelColor;
  final Color cursorColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color? backgroundColor;
  final Function(String?)? onSaved;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onSaved:  onSaved,
      maxLines:  maxLines,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      enabled: enabled,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      cursorColor: cursorColor,
      cursorHeight: 20,
      cursorWidth: 2.5,
      cursorRadius: const Radius.circular(10),
      decoration: InputDecoration(
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: hintColor,
        ),
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: labelColor,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: _border(enabledBorderColor),
        focusedBorder: _border(focusedBorderColor),
        errorBorder: _border(errorBorderColor),
        focusedErrorBorder: _border(errorBorderColor),
        border: _border(enabledBorderColor),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }
}
