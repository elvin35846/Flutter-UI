import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gazpromneft_price/price_data.dart';

// ignore: must_be_immutable
class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({Key? key}) : super(key: key);

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  List result = [];
  Map result_1 = {};
  Map result_2 = {};

  Future searchData(String param) async {
    result = [];
    result = gazpromListData
        .where((element) => element.toLowerCase().contains(param.toLowerCase()))
        .toList();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller1 = TextEditingController();
    TextEditingController _controller2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Məhsul muqaisesi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _controller1,
                    autofocus: false,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller1.text = '';
                            result_1 = {};
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await searchData(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Text(suggestion.toString(),
                          style: const TextStyle(fontSize: 16)),
                    );
                  },
                  noItemsFoundBuilder: (conetxt) =>
                      const Text('Məlumat tapılmadı!'),
                  onSuggestionSelected: (suggestion) {
                    _controller1.text = suggestion.toString();

                    allData.map((val) {
                      if (val['name'] == suggestion.toString()) {
                        result_1 = val;
                      }
                    }).toList();
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _controller2,
                    autofocus: false,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller2.text = '';
                            result_2 = {};
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await searchData(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Text(suggestion.toString(),
                          style: const TextStyle(fontSize: 16)),
                    );
                  },
                  noItemsFoundBuilder: (conetxt) =>
                      const Text('Məlumat tapılmadı!'),
                  onSuggestionSelected: (suggestion) {
                    _controller2.text = suggestion.toString();

                    allData.map((val) {
                      if (val['name'] == suggestion.toString()) {
                        result_2 = val;
                      }
                    }).toList();
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.32,
                child: SingleChildScrollView(
                    child: result_1.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(result_1['name'].toString()),
                              Text(result_1['type'].toString()),
                            ],
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: const Center(
                                child: Text(
                              'Məlumat yoxdu!',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 26),
                            )),
                          )),
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.32,
                child: SingleChildScrollView(
                    child: result_2.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(result_2['name'].toString()),
                              Text(result_2['type'].toString()),
                            ],
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: const Center(
                                child: Text(
                              'Melumat yoxdu!',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 26),
                            )),
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
