import 'package:flutter/material.dart';
import 'package:lesson9/models/login_request_model.dart';
import 'package:lesson9/screens/main_page_view.dart';
import 'package:lesson9/utils/app_size/app_size.dart';
import 'dart:io' show Platform;
import 'package:lesson9/utils/network_util/network_util.dart';
import 'package:lesson9/utils/themes/theme.dart';
import 'package:lesson9/widgets/custom_button_widget.dart';
import 'package:lesson9/widgets/custom_textfield_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  bool _validateUsername = false;
  bool _validatePassword = false;
  bool _checkBoxValue = false;
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.scaffoldBackgroundColor,
      body: Center(
          child: Container(
        width: (MediaQuery.of(context).size.width < 500)
            ? AppSize.calculateWidth(context, 400)
            : AppSize.calculateWidth(context, 200),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Themes.primaryColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFieldWidget(
                textEditingController: userNameEditingController,
                validate: _validateUsername,
                errorText: "İstifadəçi adı boş qala bilməz",
                hintText: "İstifadəçi adı",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFieldWidget(
                textEditingController: passwordEditingController,
                validate: _validatePassword,
                errorText: "Şifrə boş qala bilməz",
                hintText: "Şifrə",
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Yadda saxla'),
                  Checkbox(
                      activeColor: Themes.primaryColor,
                      value: _checkBoxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkBoxValue = value!;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              (_isLoading == false)
                  ? SizedBox(
                      height: 40,
                      width: 150,
                      child: CustomButtonWidget(
                        onPressed: () {
                          setState(() {
                            userNameEditingController.text.isEmpty
                                ? _validateUsername = true
                                : _validateUsername = false;
                            passwordEditingController.text.isEmpty
                                ? _validatePassword = true
                                : _validatePassword = false;
                          });
                          if (_validateUsername == false &&
                              _validatePassword == false) {
                            login();
                          }
                        },
                        buttonText: 'Daxil ol',
                        textFontSize: 14,
                        textColor: Colors.white,
                        buttonBackgroundColor: Themes.primaryColor,
                        buttonBorderRadius: 10,
                        buttonSideColor: Themes.primaryColor,
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: Themes.primaryColor,
                      strokeWidth: 2,
                    ),
            ],
          ),
        ),
      )),
    );
  }

  login() async {
    setState(() {
      _isLoading = true;
    });
    LoginRequestModel loginRequestModel = LoginRequestModel(
        username: userNameEditingController.text,
        password: passwordEditingController.text);
    var response = await WebService.signIn(loginRequestModel, _checkBoxValue);
    if (response == true) {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainView()),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
