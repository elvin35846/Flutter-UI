import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app_user/utils/themes/theme.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.textButton,
    required this.click,
  }) : super(key: key);

  final String textButton;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton(
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          click();
        },
      ),
      decoration: BoxDecoration(
          color: Themes.primaryColor, borderRadius: BorderRadius.circular(20)),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.textEditingController,
    required bool validate,
    required this.errorText,
    this.hintText,
    this.obscureText = false,
    this.labelText,
    this.maxLength,
    this.suffix,
    this.textInputType,
    this.prefix,
    this.inputFormatters,
  })  : _validate = validate,
        super(key: key);

  final TextEditingController textEditingController;
  final bool _validate;
  final String errorText;
  final String? hintText;
  final bool obscureText;
  final int? maxLength;
  final Widget? suffix;
  final String? labelText;
  final TextInputType? textInputType;
  final Widget? prefix;
  final bool? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        inputFormatters == true
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      controller: textEditingController,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: prefix,
        labelText: labelText,
        labelStyle: const TextStyle(color: Themes.primaryTextcolor),
        suffixIcon: suffix,
        errorText: _validate ? errorText : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Themes.primaryTextcolor),
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

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.textFontSize,
      required this.textColor,
      required this.buttonBackgroundColor,
      required this.buttonBorderRadius,
      required this.buttonSideColor,
      required this.onPressed})
      : super(key: key);

  final String buttonText;
  final double textFontSize;
  final Color textColor;
  final Color buttonBackgroundColor;
  final double buttonBorderRadius;
  final Color buttonSideColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: textFontSize, color: textColor),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(buttonBackgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                  side: BorderSide(color: buttonSideColor)))),
    );
  }
}
