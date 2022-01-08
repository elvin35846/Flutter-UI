import 'package:flutter/material.dart';
import 'package:kroon_oil/models/Product.dart';
import 'package:kroon_oil/screens/detail_pages/detail_screen.dart';

import 'item_card.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewWidget();
    // return SingleChildScrollView(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Text(
    //           'Синтетич. для легк. автом.'.toUpperCase(),
    //           style: const TextStyle(fontSize: 16, color: Colors.white),
    //         ),
    //       ),
    //       //Expanded(child: const NewWidget()),
    //       Text(
    //         'Синтетич. для легк. автом.'.toUpperCase(),
    //         style: const TextStyle(fontSize: 16, color: Colors.white),
    //       ),
    //       //SizedBox(height: 500, child: const NewWidget()),
    //     ],
    //   ),
    // );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: syntPassCar.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) => ItemCard(
        product: syntPassCar[index],
        press: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(productDetail: syntPassCar[index]),
          ),
        ),
      ),
    );
  }
}
