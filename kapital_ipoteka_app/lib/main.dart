import 'package:flutter/material.dart';
import 'package:kapital_ipoteka_app/constants.dart';
import 'package:kapital_ipoteka_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ipoteka App',
      theme: ThemeData(
        scaffoldBackgroundColor: kDefaulBgColor,
        appBarTheme: const AppBarTheme(color: kDefaulBgColor),
      ),
      home: const HomeScreen(),
    );
  }
}
