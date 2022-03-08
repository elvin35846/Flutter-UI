import 'package:flutter/material.dart';
import 'package:gazpromneft_price/screens/gazprom_page.dart';
import 'package:gazpromneft_price/screens/genergy_page.dart';
import 'package:gazpromneft_price/screens/kroon_page.dart';
import 'package:gazpromneft_price/screens/prior_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    GazpromPage(),
    GenergyPage(),
    KroonPage(),
    PriorPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('07.08.2022 Qiymet cedveli'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.query_stats,
                  size: 32,
                )),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/gazprom.png',
              height: 30,
            ),
            label: 'Gazprom',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/genergy.png',
              height: 30,
            ),
            label: 'G-energy',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/kroon.png',
              height: 30,
            ),
            label: 'Kroon',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/prior.png',
              height: 30,
            ),
            label: 'Prior',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
