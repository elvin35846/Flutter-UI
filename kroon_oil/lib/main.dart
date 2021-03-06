import 'package:flutter/material.dart';
import 'package:kroon_oil/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kroon Oil Catalog',
      home: HomePage(),
    );
  }
}
