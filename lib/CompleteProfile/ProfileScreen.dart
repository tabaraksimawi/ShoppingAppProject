import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'ProfileBody.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: DefaultElements.kprimarycolor
        ),
        elevation: 0.2,
        backgroundColor: DefaultElements.kdefaultbgcolor,
      ),
      body: Body(),
    );
  }
}