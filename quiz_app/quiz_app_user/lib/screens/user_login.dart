import 'package:flutter/material.dart';
import 'package:quiz_app_user/utils/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController userFincodeController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Themes.bgColor,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                  width: 100,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: userFincodeController,
                  decoration: InputDecoration(
                    //errorText: '5555555',
                    hintText: 'Fin Code',
                    //suffixIcon: 'suffixIcon',
                    filled: true,
                    fillColor: Themes.textFieldBgColor,
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Themes.textFieldBgColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Themes.textFieldBgColor,
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
                        color: Themes.textFieldBgColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                (_isLoading == false)
                    ? SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: Themes.buttomTextSize,
                            ),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Themes.secondaryColor),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(
                        color: Themes.secondaryColor,
                        strokeWidth: 2,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
  }
}
