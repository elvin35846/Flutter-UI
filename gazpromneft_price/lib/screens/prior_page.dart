import 'package:flutter/material.dart';
import 'package:gazpromneft_price/price_data.dart';

class PriorPage extends StatefulWidget {
  const PriorPage({Key? key}) : super(key: key);

  @override
  State<PriorPage> createState() => _PriorPageState();
}

class _PriorPageState extends State<PriorPage> {
  final TextEditingController? _textEditingController = TextEditingController();
  List priceSearchPrior = priorPrice;
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
                    priceSearchPrior = [];
                    priceSearchPrior = priorPrice
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
                          priceSearchPrior = priorPrice;
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
                  itemCount: priceSearchPrior.length,
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
                            Expanded(
                                child: Text(
                              priceSearchPrior[index]['name'],
                              style: const TextStyle(fontSize: 18),
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var item in priceSearchPrior[index]
                                    ['price'])
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    ),
                                  ),
                              ],
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
