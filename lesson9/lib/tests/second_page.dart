import 'package:flutter/material.dart';
import 'package:lesson9/tests/first_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: TextButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FirstPage()));
            },
            child: const Text('birinci sehifeye get'),
          ),
        ));
  }
}
