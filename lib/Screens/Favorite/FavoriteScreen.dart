import 'package:flutter/material.dart';

import './FavoriteBody.dart';
import '../Core/Component/DefaultElements.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/Favorite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: DefaultElements.headingStyle,
        ),
      ),
      body: FavoriteBody(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favorite),
    );
  }
}
