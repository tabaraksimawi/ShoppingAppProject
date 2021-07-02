import 'package:flutter/material.dart';

import 'SignUpBody.dart';
class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
