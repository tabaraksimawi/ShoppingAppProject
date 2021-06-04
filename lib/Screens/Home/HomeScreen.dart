import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/NavBar.dart';
import 'package:myshopping_app/Screens/Home/HomeBody.dart';

import '../enum.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
