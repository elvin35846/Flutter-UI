import 'package:flutter/material.dart';

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Examle_2'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('MainAxisSize.min'),
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xffa0c4ff),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('MainAxisAlignment.center'),
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xffffb703),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('MainAxisAlignment.spaceAround'),
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xff414833),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('MainAxisAlignment.spaceEvenly'),
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xff6d6875),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('MainAxisAlignment.spaceBetween'),
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xff00bbf9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                  Icon(Icons.star, color: Color(0xffef233c)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xff62b6cb), width: 4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 195,
                    color: Colors.red,
                    child: const Center(
                        child: Text(
                      '65',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 300,
                    color: const Color(0xffa7c957),
                    child: const Center(
                        child: Text(
                      '100',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 222,
                    color: const Color(0xfff9844a),
                    child: const Center(
                        child: Text(
                      '74',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 120,
                    color: const Color(0xffff006e),
                    child: const Center(
                        child: Text(
                      '40',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 240,
                    color: const Color(0xffffb5a7),
                    child: const Center(
                        child: Text(
                      '80',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 105,
                    color: const Color(0xff1982c4),
                    child: const Center(
                        child: Text(
                      '35',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (double i = 5; i < 25; i += 5)
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 20,
                    width: i * 10,
                    color: Colors.green,
                    child: Center(child: Text((i * 10).toString())),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
