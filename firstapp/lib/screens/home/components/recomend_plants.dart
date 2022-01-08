import 'package:firstapp/constants.dart';
import 'package:firstapp/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class RecomendPlants extends StatelessWidget {
  const RecomendPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
        child: Row(
          children: [
            RecomentPlantCard(
              image: "assets/images/image_1.png",
              title: "Samantha",
              country: "Russia",
              price: 440,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailScreen()));
              },
            ),
            RecomentPlantCard(
              image: "assets/images/image_2.png",
              title: "Angelica",
              country: "Russia",
              price: 350,
              press: () {},
            ),
            RecomentPlantCard(
              image: "assets/images/image_3.png",
              title: "Samantha",
              country: "Russia",
              price: 440,
              press: () {},
            ),
            RecomentPlantCard(
              image: "assets/images/image_1.png",
              title: "Samantha",
              country: "Russia",
              price: 440,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RecomentPlantCard extends StatelessWidget {
  final String image, title, country;
  final int price;
  final void Function() press;

  const RecomentPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
          top: kDefaultPadding / 2,
        ),
        width: size.width * 0.32,
        child: Column(
          children: [
            Image.asset(image),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                            text: country.toUpperCase(),
                            style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text('\$$price',
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: kPrimaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
