import 'package:firstapp/constants.dart';
import 'package:flutter/material.dart';

class FuturePlant extends StatelessWidget {
  const FuturePlant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FuturePlantCard(
              press: () {}, image: "assets/images/bottom_img_1.png"),
          FuturePlantCard(
              press: () {}, image: "assets/images/bottom_img_2.png"),
        ],
      ),
    );
  }
}

class FuturePlantCard extends StatelessWidget {
  final String image;
  final void Function() press;
  const FuturePlantCard({
    required this.image,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
