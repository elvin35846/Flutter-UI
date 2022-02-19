import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.oilList}) : super(key: key);

  final Map oilList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  oilList['image'],
                  width: 200,
                ),
                const SizedBox(height: 40),
                Text(
                  oilList['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  oilList['specificationsTitle'],
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  oilList['specifications'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 40,
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      oilList['description'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      oilList['title'],
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      oilList['subtitle'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      oilList['dataTitle'],
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      oilList['data'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
