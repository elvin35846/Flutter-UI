import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonn5/pages/home/controller/home_controller.dart';
//import 'package:lessonn5/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'HomeController counter ${homeController.count}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    homeController.decriment();
                  },
                  child: const Text(
                    '-',
                  ),
                ),
                const SizedBox(width: 30),
                OutlinedButton(
                  onPressed: () {
                    homeController.increment();
                  },
                  child: const Text(
                    '+',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Get.toNamed('/detail');
              },
              child: const Text(
                'Go to detail',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
