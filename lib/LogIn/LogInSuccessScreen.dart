import 'package:flutter/material.dart';

import 'LogInSucessBody.dart';
class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}