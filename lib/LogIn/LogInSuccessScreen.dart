import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'LogInSucessBody.dart';
class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: DefaultElements.kdefaultbgcolor,
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}