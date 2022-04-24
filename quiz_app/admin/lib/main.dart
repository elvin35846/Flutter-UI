import 'package:admin/screens/home_page.dart';
import 'package:admin/screens/create_student.dart';
import 'package:admin/screens/create_teacher.dart';
import 'package:admin/screens/auth/login_view.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: LoginView(),
    debugShowCheckedModeBanner: false,
  ));
}
