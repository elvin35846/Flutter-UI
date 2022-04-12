import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          data['name'],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  data['type'],
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  child: data['image'] != ''
                      ? Image.network(
                          data['image'],
                          height: 250,
                        )
                      : const Image(
                          image: AssetImage('assets/images/default.jpg'),
                          height: 220,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  data['characteristic'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data['description'],
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                'Применение',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              const SizedBox(height: 5),
              Text(
                data['use'],
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                'Стандартный анализ',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              const SizedBox(height: 5),
              Text(
                data['test'],
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
