import 'package:cake_app/const.dart';
import 'package:flutter/material.dart';

import 'cookie_detail.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic cardScreenSize = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: kDeffaultBgColor,
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: [
                _buildCard(
                    name: 'VUPPİ PEY',
                    price: '24 AZN',
                    imgPath: 'assets/images/cake_1.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: '"BLACK FOREST" TORTU',
                    price: '24.9 AZN',
                    imgPath: 'assets/images/cake_2.jpg',
                    added: true,
                    isFavorite: true,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: 'TİRAMİSU&BLACK FOREST',
                    price: '20.1 AZN',
                    imgPath: 'assets/images/cake_3.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: '"TİRAMİSU" TORTU',
                    price: '21 AZN',
                    imgPath: 'assets/images/cake_4.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: '"RED VELVET" TORTU',
                    price: '28.8 AZN',
                    imgPath: 'assets/images/cake_5.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: '"XURMALI KUDRYAŞ" TORTU',
                    price: '32 AZN',
                    imgPath: 'assets/images/cake_6.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: '"ABŞERON" TORTU',
                    price: '25 AZN',
                    imgPath: 'assets/images/cake_7.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
                _buildCard(
                    name: '"NAPOLEON" TORTU',
                    price: '23.1 AZN',
                    imgPath: 'assets/images/cake_8.jpg',
                    added: false,
                    isFavorite: false,
                    cardScreenSize: cardScreenSize,
                    context: context),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCard(
      {String? name,
      String? price,
      String? imgPath,
      bool? added,
      bool? isFavorite,
      dynamic cardScreenSize,
      final context}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 5,
        right: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CookieDetail(
                    imgPath: imgPath,
                    price: price,
                    name: name,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
            color: kDeffaultBgColor,
          ),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isFavorite == true
                          ? const Icon(
                              Icons.favorite,
                              color: kAppIconColor,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: kDeffaultIconColor,
                            )
                    ],
                  ),
                  Hero(
                    tag: '$imgPath',
                    child: Image.asset(
                      '$imgPath',
                      width: cardScreenSize / 2 * 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    '$price',
                    style: const TextStyle(
                      color: kAppIconColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$name',
                    style: const TextStyle(
                        color: kDeffaultIconColor, fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      color: Colors.grey,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (added == false) ...[
                          const Icon(
                            Icons.shopping_basket,
                            color: kAppIconColor,
                            size: 18,
                          ),
                          const Text(
                            'Add to card',
                            style: TextStyle(
                              color: kAppIconColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                        if (added == true) ...[
                          const Icon(
                            Icons.remove_circle_outline,
                            color: kDeffaultIconColor,
                            size: 18,
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                              color: kAppIconColor,
                              fontSize: 12,
                            ),
                          ),
                          const Icon(
                            Icons.add_circle_outline,
                            color: kDeffaultIconColor,
                            size: 18,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
