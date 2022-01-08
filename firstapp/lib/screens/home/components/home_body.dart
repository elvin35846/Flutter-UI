import 'package:firstapp/constants.dart';
import 'package:firstapp/screens/home/components/future_plant.dart';
import 'package:firstapp/screens/home/components/header_whith_serach_box.dart';
import 'package:firstapp/screens/home/components/recomend_plants.dart';
import 'package:firstapp/screens/home/components/title_with_more_btn.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          const RecomendPlants(),
          const SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          const FuturePlant(),
        ],
      ),
    );
  }
}
