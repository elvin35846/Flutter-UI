import 'package:flutter/material.dart';

class Lesson5 extends StatelessWidget {
  const Lesson5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/lesson5.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              const SizedBox(height: 30),
              const Text(
                'Plan your trip easiest\nway posible',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'And that`s fact filemountain was selected\nas best could storage provider in the work!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  size: 32,
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff40d4a0),
                    onPrimary: Colors.white,
                    shadowColor: const Color(0xff40d4a0),
                    elevation: 3,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
