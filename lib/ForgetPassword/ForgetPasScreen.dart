import 'package:flutter/material.dart';

import 'ForgetPasBody.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}