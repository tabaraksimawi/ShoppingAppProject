import 'package:flutter/material.dart';

import 'SignInBody.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
