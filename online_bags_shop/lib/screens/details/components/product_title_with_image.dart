import 'package:flutter/material.dart';
import 'package:online_bags_shop/constants.dart';
import 'package:online_bags_shop/models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.detBodyProduct,
  }) : super(key: key);

  final Product detBodyProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detBodyProduct.description,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            detBodyProduct.title,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'Price\n'),
                    TextSpan(
                      text: "\$${detBodyProduct.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPadding * 2),
              Expanded(
                  child: Image.asset(
                detBodyProduct.image,
                fit: BoxFit.fill,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
