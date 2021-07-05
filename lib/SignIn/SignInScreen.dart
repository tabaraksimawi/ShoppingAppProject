import 'package:flutter/material.dart';

import 'SignInBody.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:google_fonts/google_fonts.dart';
class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
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
