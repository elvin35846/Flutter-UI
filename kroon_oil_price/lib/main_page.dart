import 'package:flutter/material.dart';
import 'package:kroon_oil_price/my_data.dart';
import 'package:kroon_oil_price/product_detaile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController? _textEditingController = TextEditingController();
  List oilListSearch = oilList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff333333),
        title: Image.asset(
          'assets/images/kroon_logo.png',
          height: 50,
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xff333333),
                border: Border.all(style: BorderStyle.none),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(90)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                    ),
                    child: TextField(
                      style: const TextStyle(
                          color: Color(0xff333333), fontSize: 16),
                      onChanged: (value) {
                        setState(() {
                          oilListSearch = [];
                          oilListSearch = oilList
                              .where((element) => element['name']
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFE30B)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFE30B)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFE30B),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(color: Color(0xff333333), fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/icons/search_icon.png', width: 30),
                ],
              ),
            ),
          ),
          Positioned(
            top: 99,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 180,
                  decoration: BoxDecoration(
                    color: const Color(0xff333333),
                    border: Border.all(style: BorderStyle.none),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 180,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB),
                    border: Border.all(style: BorderStyle.none),
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(90)),
                  ),
                  child: ListView.builder(
                      itemCount: _textEditingController!.text.isNotEmpty
                          ? oilListSearch.length
                          : oilList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                        oilList: oilList[index])));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                    oilListSearch[index]['image'],
                                  ),
                                  width: 120,
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Flexible(
                                        child: Text(
                                          oilListSearch[index]['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffF3AB16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var item in oilListSearch[index]
                                            ['price'])
                                          Text(
                                            item,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
