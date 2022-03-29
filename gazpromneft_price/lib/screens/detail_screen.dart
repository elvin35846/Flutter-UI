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
        title: Text(data['name']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data['type'],
                style: const TextStyle(fontSize: 22, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: data['image'] != ''
                    ? Image.network(
                        data['image'],
                        height: 300,
                      )
                    : const Image(
                        image: AssetImage('assets/images/default.jpg'),
                        height: 250,
                      ),
              ),
              const SizedBox(height: 20),
              Text(
                data['specifications'],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
