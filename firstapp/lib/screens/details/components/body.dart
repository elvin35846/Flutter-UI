import 'package:firstapp/constants.dart';
import 'package:firstapp/screens/details/components/image_and_icons.dart';
import 'package:firstapp/screens/details/components/title_and_price.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const ImageAndIcons(),
          const TitleAndPrice(title: "Angelica", country: "Russia", price: 440),
          const SizedBox(height: kDefaultPadding / 2),
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Buy now",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20))),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 84,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Description",
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
