import 'package:flutter/material.dart';

import './ProfileBody.dart';
import '../Core/Component/DefaultElements.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: DefaultElements.headingStyle,
        ),
      ),
      body: Body(),
    );
  }
}
