import 'package:flutter/material.dart';
import 'package:kroon_oil/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function()? press;

  const ItemCard({
    Key? key,
    this.press,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              product!.image_5.toString(),
            ),
            const SizedBox(height: 15),
            Text(
              product!.title.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
