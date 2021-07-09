import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'SignUpBody.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: DefaultElements.kprimarycolor),
        elevation: 0.2,
        backgroundColor: DefaultElements.kdefaultbgcolor,
      ),
      body: Body(),
    );
  }
}
