import 'package:flutter/material.dart';
import 'package:quiz_app_user/screens/user_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz_app_user',
      home: UserLogin(),
    );
  }
}
