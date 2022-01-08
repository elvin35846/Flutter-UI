import 'package:cake_app/const.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'cookie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDeffaultBgColor,
      appBar: AppBar(
        backgroundColor: kDeffaultBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
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
        padding: const EdgeInsets.only(left: kDeffaultPadding),
        children: [
          const SizedBox(height: 15),
          const Text(
            'Kateqoriyalar',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: kAppIconColor),
          ),
          const SizedBox(height: 15),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: kAppIconColor,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: kDeffaultPadding * 1.5),
            unselectedLabelColor: const Color(0xffcdcdcd),
            tabs: const [
              Tab(
                child: Text(
                  'Tort',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  'Desert',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  'Şərq şirniyyatı',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  'Peçenyalar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                CookiePage(),
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ],
            ),
          ),
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
