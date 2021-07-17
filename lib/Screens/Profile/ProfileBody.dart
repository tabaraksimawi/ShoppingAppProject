import 'package:flutter/material.dart';

import '../../Providers/providers.dart';
import '../NoAccountWarning.dart';
import '../Splash/SplashScreen.dart';
import './ProfileMenu.dart';
import './ProfilePic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return _userProvider.isGuest
        ? NoAccountWarningWidget()
        : SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProfilePic(),
                Text(_userProvider.user.fullName),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
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
                  press: () async {
                    try {
                      _userProvider.signOut();
                      Provider.of<CartProvider>(context, listen: false)
                          .disposer();
                      Provider.of<FavoriteProvider>(context, listen: false)
                          .disposer();

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          SplashScreen.routeName, (route) => false);
                    } catch (e) {
                      print(e);
                    }
                    // Navigator.pushNamed(context, WelcomeScreen.routeName);
                  },
                ),
              ],
            ),
          );
  }
}
