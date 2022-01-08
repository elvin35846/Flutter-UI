import 'package:flutter/material.dart';
import 'package:kroon_oil/models/Product.dart';
import 'package:kroon_oil/screens/detail_pages/detail_screen.dart';

import 'item_card.dart';

class SinteticCarAuto extends StatelessWidget {
  const SinteticCarAuto({Key? key}) : super(key: key);

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
