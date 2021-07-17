import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../Providers/providers.dart';
import '../Core/Component/NavBar.dart';
import './HomeBody.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context, listen: false).init();
      Provider.of<FavoriteProvider>(context, listen: false).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
