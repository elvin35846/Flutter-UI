import 'package:flutter/material.dart';

import 'lesson11home/lesson5.dart';

class Lesson11Home extends StatelessWidget {
  const Lesson11Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lesson 11 at home ',
      home: Lesson5(),
    );
  }
}
