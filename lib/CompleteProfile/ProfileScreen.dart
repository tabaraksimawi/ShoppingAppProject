import 'package:flutter/material.dart';

import 'ProfileBody.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}