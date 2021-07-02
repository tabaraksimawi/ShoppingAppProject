import 'package:flutter/material.dart';

import 'SignInBody.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        title: Text("Log In"),
      ),
      body: Body(),
    );
  }
}
