import 'package:flutter/material.dart';
import 'package:gazpromneft_price/price_data.dart';

class KroonPage extends StatefulWidget {
  const KroonPage({Key? key}) : super(key: key);

  @override
  State<KroonPage> createState() => _KroonPageState();
}

class _KroonPageState extends State<KroonPage> {
  final TextEditingController? _textEditingController = TextEditingController();
  List priceSearchKroon = kroonPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: TextField(
                style: const TextStyle(color: Color(0xff333333), fontSize: 20),
                onChanged: (value) {
                  setState(() {
                    priceSearchKroon = [];
                    priceSearchKroon = kroonPrice
                        .where((element) => element['name']
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textEditingController?.clear();
                        setState(() {
                          priceSearchKroon = kroonPrice;
                        });
                      },
                      icon: const Icon(Icons.clear)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Axtar',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 177, 169, 169), fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 220,
              child: ListView.builder(
                  itemCount: priceSearchKroon.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            priceSearchKroon[index]['image'] != null
                                ? Image.network(
                                    priceSearchKroon[index]['image'],
                                    width: 120,
                                  )
                                : Container(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    priceSearchKroon[index]['name'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var item in priceSearchKroon[index]
                                          ['price'])
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
