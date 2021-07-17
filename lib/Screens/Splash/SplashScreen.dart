import 'package:flutter/material.dart';
import '../Core/Component/DefaultElements.dart';
import 'package:myshopping_app/Providers/userProvider.dart';
import 'package:myshopping_app/Screens/Home/HomeScreen.dart';
import 'package:provider/provider.dart';

import '../Core/SizeConfig.dart';
import 'SplashBody.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Consumer<UserProvider>(
      builder: (context, state, _) {
        return initRoute(state);
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      backgroundColor: DefaultElements.kdefaultbgcolor,
      body: Body(),
    );
  }
}

Widget initRoute(UserProvider state) {
  if (state.authState == AuthState.init ||
      state.authState == AuthState.notAuthenticated)
    return WelcomeScreen();
  else if (state.authState == AuthState.authenticated ||
      state.authState == AuthState.guest)
    return HomeScreen();
  else
    return WelcomeScreen();
}
