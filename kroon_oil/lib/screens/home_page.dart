import 'package:flutter/material.dart';
import 'package:kroon_oil/screens/tabs_pages/all_products.dart';
import 'package:kroon_oil/screens/tabs_pages/sintetic_car_auto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/images/kroon_logo.png'),
          height: 60,
        ),
        bottom: TabBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: _controller,
          tabs: [
            Tab(
              child: Text(
                'Все',
                style: TextStyle(
                    color:
                        _controller.index == 0 ? Colors.yellow : Colors.white,
                    fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                'Синтетич. для легк. автом.',
                style: TextStyle(
                    color:
                        _controller.index == 1 ? Colors.yellow : Colors.white,
                    fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                'Минер. для легк. автом.',
                style: TextStyle(
                    color:
                        _controller.index == 2 ? Colors.yellow : Colors.white,
                    fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                'Синтетич. для тяжолых условий.',
                style: TextStyle(
                    color:
                        _controller.index == 3 ? Colors.yellow : Colors.white,
                    fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                'Минер. для тяжолых условий.',
                style: TextStyle(
                    color:
                        _controller.index == 4 ? Colors.yellow : Colors.white,
                    fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                'Минеральные, сезонные.',
                style: TextStyle(
                    color:
                        _controller.index == 5 ? Colors.yellow : Colors.white,
                    fontSize: 20),
              ),
            ),
          ],
          isScrollable: true,
          indicatorColor: Colors.yellow,
          indicatorWeight: 4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TabBarView(
          controller: _controller,
          children: const [
            AllProducts(),
            SinteticCarAuto(),
            Text("3", style: TextStyle(color: Colors.white)),
            Text("4", style: TextStyle(color: Colors.white)),
            Text("5", style: TextStyle(color: Colors.white)),
            Text("6", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
