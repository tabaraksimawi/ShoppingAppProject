import 'package:flutter/material.dart';
import 'package:myshopping_app/Splash/SplashScreen.dart';
import 'ProfileMenu.dart';
import 'ProfilePic.dart';
import 'package:myshopping_app/Screens/UserInfo.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {  Navigator.pushNamed(context, UserInfo.routeName)
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, SplashScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
