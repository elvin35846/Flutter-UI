import 'package:flutter/material.dart';
import 'package:quiz_app_user/screens/quiz_screen.dart';
import 'package:quiz_app_user/screens/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLogin = false;
  @override
  void initState() {
    controlUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz_app_user',
      home: _isLogin == false ? const UserLogin() : const QuizScreen(),
      //home: QuizScreen(),
    );
  }

  controlUserLogin() async {
    final prefs = await SharedPreferences.getInstance();

    print('isRemember' + prefs.getBool('isRemember').toString());
    if (prefs.getBool('isRemember') == true) {
      setState(() {
        _isLogin = true;
      });
    } else {
      setState(() {
        _isLogin = false;
      });
    }
  }
}
