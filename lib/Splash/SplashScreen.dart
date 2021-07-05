import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';

import '../SizeConfig.dart';
import 'SplashBody.dart';
class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: DefaultElements.kdefaultbgcolor,
      body: Body(),
    );
  }
}
