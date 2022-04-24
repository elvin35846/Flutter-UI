import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/screens/home_page_view.dart';
import 'package:teacher/screens/login_page_view.dart';

main() {
  runApp(QuizAppTeacher());
}

class QuizAppTeacher extends StatefulWidget {
  const QuizAppTeacher({Key? key}) : super(key: key);

  @override
  State<QuizAppTeacher> createState() => _QuizAppTeacherState();
}

class _QuizAppTeacherState extends State<QuizAppTeacher> {
  bool isLogin = false;
  @override
  void initState() {
    controlUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (isLogin == false) ? LoginView() : HomePage(),
    );
  }

  controlUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? authorization = prefs.getBool('isRemember');

    if (authorization == true) {
      setState(() {
        isLogin = true;
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
  }
}
