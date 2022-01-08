import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example 1'),
        ),
        body: Row(
          children: const [
            ColumnOne(),
            ColumnTwo(),
            ColumnThree(),
          ],
        ),
      ),
    );
  }
}

class ColumnOne extends StatelessWidget {
  const ColumnOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff2a9d8f),
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ))),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe63946),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '4',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff4a261),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '7',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff457b9d),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '10',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
        ],
      ),
    );
  }
}

class ColumnTwo extends StatelessWidget {
  const ColumnTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffa5a58d),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '2',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffddbea9),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '5',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfffcd5ce),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '8',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff9c6644),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '11',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
        ],
      ),
    );
  }
}

class ColumnThree extends StatelessWidget {
  const ColumnThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffc9184a),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '3',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfffca311),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '6',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff2b2d42),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '9',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffa5a58d),
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: const Center(
                    child: Text(
                  '12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )),
              )),
        ],
      ),
    );
  }
}
