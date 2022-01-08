import 'package:flutter/material.dart';

class Ders9 extends StatelessWidget {
  const Ders9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.remove),
                const Icon(Icons.person_add),
                const Icon(Icons.menu_book),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Enter'),
                  style: ElevatedButton.styleFrom(
                      elevation: 0, onPrimary: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                  style: TextButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
