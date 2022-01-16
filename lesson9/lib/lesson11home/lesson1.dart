import 'package:flutter/material.dart';

class Lesson1 extends StatelessWidget {
  const Lesson1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6d82f5),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 80,
        ),
        child: Column(
          children: [
            Container(
              width: 240,
              height: 240,
              child: Image.asset(
                'assets/images/lesson1.png',
              ),
              decoration: BoxDecoration(
                color: const Color(0xff7c90f3),
                borderRadius: BorderRadius.circular(120),
              ),
            ),
            const SizedBox(height: 26),
            const Text(
              'Manage your files\nthe best way',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'And that`s fact filemountain was selected as best could storage provider in the work!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.6),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Let`s go',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: const Color(0xff7c90f3),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
            )
          ],
        ),
      ),
    );
  }
}
