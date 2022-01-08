import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonn5/pages/detail/view/detail.dart';
import 'package:lessonn5/pages/home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/detail', page: () => const DetailScreen()),
      ],
      initialRoute: '/home',
    );
  }
}
