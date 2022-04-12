import 'package:flutter/material.dart';
import 'package:lesson9/tests/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SecondPage()));
          },
          child: const Text('ikinci sehifeye get'),
        ),
      ),
    );
  }
}
//bir sehifeden digerine gedir change screen
// Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));

//sehifeni replace edir yeni silir sehifeni onun yerine cagirilan sehifeni acir
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SecondPage()));

// hal hazirda olan sehifeni baglayir
//Navigator.pop(context);
