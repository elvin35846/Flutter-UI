import 'package:flutter/material.dart';
import 'package:gazpromneft_price/price_data.dart';
import 'package:gazpromneft_price/screens/detail_screen.dart';

class GenergyPage extends StatefulWidget {
  const GenergyPage({Key? key}) : super(key: key);

  @override
  State<GenergyPage> createState() => _GenergyPageState();
}

class _GenergyPageState extends State<GenergyPage> {
  final TextEditingController? _textEditingController = TextEditingController();
  List priceSearchGenergy = genergyPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: TextField(
                style: const TextStyle(color: Color(0xff333333), fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    priceSearchGenergy = [];
                    priceSearchGenergy = genergyPrice
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
                          priceSearchGenergy = genergyPrice;
                        });
                      },
                      icon: const Icon(
                        Icons.clear,
                        size: 20,
                      )),
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  hintText: 'Axtar',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 177, 169, 169), fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            top: 64,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 214,
              child: ListView.builder(
                  itemCount: priceSearchGenergy.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.all(15),
                                        child: priceSearchGenergy[index]
                                                    ['image'] !=
                                                ''
                                            ? Image.network(
                                                priceSearchGenergy[index]
                                                    ['image'],
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80)
                                            : Image(
                                                image: const AssetImage(
                                                    'assets/images/default.jpg'),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: SizedBox(
                            width: 65,
                            child: priceSearchGenergy[index]['image'] != ''
                                ? Image.network(
                                    priceSearchGenergy[index]['image'])
                                : const Image(
                                    image: AssetImage(
                                        'assets/images/default.jpg')),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              priceSearchGenergy[index]['name'],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              priceSearchGenergy[index]['type'],
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var item in priceSearchGenergy[index]['price'])
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ),
                          ],
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    data: priceSearchGenergy[index],
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.info_outline,
                              size: 32,
                              color: Colors.amber,
                            ),
                          ),
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
