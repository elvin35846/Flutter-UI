import 'package:flutter/material.dart';
import 'package:lesson9/screens/auth/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/main_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controlUserLogin();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (isLogin == false) ? const LoginView() : const MainView());
  }

  // getDeviceId() async {
  //   String? deviceId = await PlatformDeviceId.getDeviceId;
  //   print(deviceId.toString()+"====>>>>>");
  // }

  controlUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authorization = prefs.getString('isRemember');

    if (authorization != false) {
      setState(() {
        isLogin = true;
      });
    } else {
      isLogin = false;
    }
  }
}
