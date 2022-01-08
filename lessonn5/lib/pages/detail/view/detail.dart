import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonn5/pages/home/controller/home_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Center(
            child: Text('Home controller count ${homeController.count}')),
      ),
    );
  }
}
