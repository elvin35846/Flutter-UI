import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'const.dart';

class CookieDetail extends StatelessWidget {
  const CookieDetail({
    Key? key,
    required this.imgPath,
    required this.price,
    required this.name,
  }) : super(key: key);
  final String? imgPath, price, name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDeffaultBgColor,
      appBar: AppBar(
        backgroundColor: kDeffaultBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kDeffaultIconColor,
          ),
        ),
        title: Image.asset(
          'assets/images/cake_logo3.jpg',
          height: 50,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: kDeffaultIconColor,
              ))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Text(
            '$name',
            style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kAppIconColor),
          ),
          Hero(
            tag: '$imgPath',
            child: Image.asset(
              '$imgPath',
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            '$price',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kAppIconColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Biskvit: Əla növ alman unu, yumurta, şəkər, Alman kakaosu, qabartma tozu. \n Krem: Kəsmik, qaymaq, kərə yağı, kakao.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              fontSize: 14,
              height: 2,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kAppIconColor,
              ),
              child: const Center(
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                      fontSize: 14,
                      color: kDeffaultBgColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.fastfood),
        backgroundColor: kAppIconColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
