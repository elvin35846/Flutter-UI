import 'package:admin/models/login_request_model.dart';
import 'package:admin/screens/home_page.dart';
import 'package:admin/screens/create_student.dart';
import 'package:admin/utils/appsize/appsize.dart';
import 'package:admin/utils/network_util/network.dart';
import 'package:admin/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  bool deyer = false;
  bool _isLoading = false;
  bool _isObcuse = true;
  @override
  void dispose() {
    super.dispose();
    userNameEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: (MediaQuery.of(context).size.width < 550)
                          ? AppSize.calculateWidth(context, 400)
                          : AppSize.calculateWidth(context, 200),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: buttonColor().withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: Column(children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 25),
                          child: CustomTextFieldWidget(
                            textEditingController: userNameEditingController,
                            validate: _validateUsername,
                            labelText: 'Istifadeci Adi',
                            errorText: 'Bu xana bos qala bilmez',
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: CustomTextFieldWidget(
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObcuse = !_isObcuse;
                                  });
                                },
                                icon: Icon(
                                  (_isObcuse)
                                      ? (Icons.visibility)
                                      : (Icons.visibility_off),
                                  color: buttonColor(),
                                ),
                              ),
                              obscureText: _isObcuse,
                              textEditingController: passwordEditingController,
                              validate: _validatePassword,
                              errorText: 'Bu xana bos qala bilmez',
                              labelText: "Sifreniz",
                            )),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Yadda saxla',
                                style: TextStyle(color: textColor()),
                              ),
                              Checkbox(
                                fillColor:
                                    MaterialStateProperty.all(buttonColor()),
                                activeColor: buttonColor(),
                                value: deyer,
                                onChanged: (value) {
                                  setState(() {
                                    deyer = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        (_isLoading == false)
                            ? SizedBox(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 25),
                                    child: CustomButtom(
                                      textButton: "Daxil OL",
                                      click: () {
                                        setState(() {
                                          if (userNameEditingController
                                              .text.isEmpty) {
                                            _validateUsername = true;
                                          } else {
                                            _validateUsername = false;
                                          }
                                          passwordEditingController.text.isEmpty
                                              ? _validatePassword = true
                                              : _validatePassword = false;
                                        });

                                        if (_validateUsername == false &&
                                            _validatePassword == false) {
                                          login();
                                        }
                                      },
                                    )))
                            : SpinKitFadingCircle(
                                color: buttonColor(),
                              ),
                      ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    setState(() {
      _isLoading = true;
    });
    LoginRequestModel loginRequestModel = LoginRequestModel(
        username: userNameEditingController.text,
        password: passwordEditingController.text);
    var response = await WebService.signIn(loginRequestModel);
    if (response == true) {
      //(response) true yazilmasa da olsa eyni seydi
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
