import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builderAppBar(),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: null,
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
    );
  }
}
