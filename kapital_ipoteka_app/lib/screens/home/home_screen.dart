import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapital_ipoteka_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: const [
            Text("data"),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          "assets/images/logo.png",
          height: 36,
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  color: Colors.red,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 40,
            ),
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'İpoteka',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Kapital Bank mənzil sahibi olmaq və ya yeniləmək istəyənlərə sərfəli şərtlərlə ipoteka krediti təklif edir.',
                  style: TextStyle(height: 1.5),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Müraciət et"),
                    style: ElevatedButton.styleFrom(
                      primary: kDefaulColor,
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Mənə zəng et",
                      style: TextStyle(color: kDefaulColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(0, 0, 0, 0),
                      elevation: 0,
                      side: const BorderSide(
                        width: 1,
                        color: kDefaulColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'İpoteka seçimləri',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Bütün ipotekalar"),
                    style: ElevatedButton.styleFrom(
                      primary: kDefaulColor,
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Daxili ipoteka",
                      style: TextStyle(color: kDefaulColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(0, 0, 0, 0),
                      elevation: 0,
                      side: const BorderSide(
                        width: 1,
                        color: kDefaulColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Dövlət ipotekası",
                      style: TextStyle(color: kDefaulColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(0, 0, 0, 0),
                      elevation: 0,
                      side: const BorderSide(
                        width: 1,
                        color: kDefaulColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(kDefaultPadding),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/image1.png',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
                const SizedBox(height: kDefaultPadding),
                const Text(
                  'Çıxarışlı evlər üçün ipoteka',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                const Text(
                  'Yeni və köhnə tikili binalarda çıxarışlı mənzillərin, həmçinin fərdi yaşayış və bağ evlərinin alınması üçün nəzərdə tutulan, bankın daxili vəsaiti hesabına təqdim edilən ipoteka krediti',
                  style: TextStyle(color: kDefaulTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
