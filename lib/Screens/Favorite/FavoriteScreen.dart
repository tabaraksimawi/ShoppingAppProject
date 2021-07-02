import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/NavBar.dart';
import 'package:myshopping_app/Screens/Favorite/FavoriteBody.dart';
import '../enum.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/Favorite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        title: Text("Favorites"),
      ),
      body: FavoriteBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}