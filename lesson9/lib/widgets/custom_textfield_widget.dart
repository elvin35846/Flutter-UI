import 'package:flutter/material.dart';
import 'package:lesson9/utils/themes/theme.dart';
//import 'package:lesson9/utils/themes/theme.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {Key? key,
      required this.textEditingController,
      required bool validate,
      required this.errorText,
      required this.hintText,
      this.obscureText = false,
      this.maxLength = 0})
      : _validate = validate,
        super(key: key);

  final TextEditingController textEditingController;
  final bool _validate;
  final String errorText;
  final String hintText;
  final bool obscureText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        errorText: _validate ? errorText : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Themes.primaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Themes.primaryColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Themes.errorColor,
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Themes.primaryColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
