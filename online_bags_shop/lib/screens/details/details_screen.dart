import 'package:flutter/material.dart';
import 'package:online_bags_shop/constants.dart';
import 'package:online_bags_shop/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_bags_shop/screens/details/components/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.detailProduct,
  }) : super(key: key);

  final Product detailProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailProduct.color,
      appBar: detailsAppBar(context),
      body: DetailsBody(
        detBodyProduct: detailProduct,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: Colors.white,
          ),
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
