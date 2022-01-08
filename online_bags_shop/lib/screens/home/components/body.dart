import 'package:flutter/material.dart';
import 'package:online_bags_shop/constants.dart';
import 'package:online_bags_shop/models/Product.dart';
import 'package:online_bags_shop/screens/details/details_screen.dart';
import 'package:online_bags_shop/screens/home/components/categories.dart';
import 'package:online_bags_shop/screens/home/components/item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
          child: Image.asset(
            "assets/images/hb_logo.png",
            height: 70,
          ),
        ),
        const Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(detailProduct: products[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
