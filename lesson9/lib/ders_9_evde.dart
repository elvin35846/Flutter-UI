import 'package:flutter/material.dart';

class Ders9Evde extends StatefulWidget {
  const Ders9Evde({Key? key}) : super(key: key);

  @override
  _Ders9EvdeState createState() => _Ders9EvdeState();
}

void add() {}

class _Ders9EvdeState extends State<Ders9Evde> {
  int value = 0;
  int value2 = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home work',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Ders 9 ev tapshirigi'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        value++;
                      });
                    },
                    child: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '$value',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        value--;
                      });
                    },
                    child: const Icon(Icons.remove),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                label: const Text('Menu'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Hello World'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: const [
                      Icon(Icons.person_add),
                      SizedBox(height: 5),
                      Text(
                        'Add person',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: const [
                      Icon(Icons.person_add, size: 35),
                      SizedBox(height: 5),
                      Text(
                        'Add person',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(color: Colors.green, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'FloatingActionButton\nvalue',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$value2',
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  value2 += 2;
                });
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  value2 -= 2;
                });
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
