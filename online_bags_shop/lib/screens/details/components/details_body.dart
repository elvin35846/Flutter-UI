import 'package:flutter/material.dart';
import 'package:online_bags_shop/models/Product.dart';
import 'package:online_bags_shop/screens/details/components/product_title_with_image.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.detBodyProduct}) : super(key: key);
  final Product detBodyProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Text('Test'),
                    ],
                  ),
                ),
                ProductTitleWithImage(detBodyProduct: detBodyProduct),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
