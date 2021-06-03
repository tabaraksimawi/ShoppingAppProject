import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/RootApp.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RootApp(),
    );
  }
}
