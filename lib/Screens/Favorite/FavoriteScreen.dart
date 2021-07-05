import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/NavBar.dart';
import 'package:myshopping_app/Screens/Favorite/FavoriteBody.dart';
import '../enum.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
class FavoriteScreen extends StatelessWidget {
  static String routeName = "/Favorite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: DefaultElements.kprimarycolor
        ),
        elevation: 0.2,
        backgroundColor: DefaultElements.kdefaultbgcolor,
        title: Text("Favorites"),
      ),
      body: FavoriteBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}