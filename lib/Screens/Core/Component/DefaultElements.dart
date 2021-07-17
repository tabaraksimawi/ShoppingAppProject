import 'package:flutter/material.dart';

import '../SizeConfig.dart';

class DefaultElements {
  static const Color kPrimaryColor = Color(0xff494f86);
  static const Color kSecondryColor = Color(0xffA1DBF5);
  static const Color kPrimaryLightColor = Color(0xfff7f7f7);

  static const knavbariconcolor = Color(0xffB7B9C8);
  static const kdefaultredcolor = Color(0xffF76269);
  static const kdefaultbgcolor = Color(0xfff7f7f7);

  static const kshoebgcolorpink = Color(0xfffddfce);
  static const kshoebgcolorblue = Color(0xffC7E4F3);
  static const kshoebgcolorgreen = Color(0xffD0E8CF);
  static const kshoebgcoloryellow = Color(0xffF4EEB8);

  static const lightShowcasebgcolorpink = Color(0xffFFECE1);
  static const lightShowcasebgcolorblue = Color(0xffD1EFFF);
  static const lightShowcasebgcolorgreen = Color(0xffE2F7E1);
  static const lightShowcasebgcoloryellow = Color(0xffFFF9C4);

  static const Color kstarratingcolor = Color(0xffFDD446);
  static const List<Color> kshoecolorOptions = [
    Color(0xffFDD446),
    Color(0xffF6565D),
    Color(0xffF9A1DA),
    Color(0xff6EA2FF),
  ];
  static const List<Color> kshoerepplecolorOptions = [
    Color(0xffF9F3DA),
    Color(0xffF7DDDD),
    Color(0xffF8EAF3),
    Color(0xffE2EAF9),
  ];

  static const kAnimationDuration = Duration(milliseconds: 200);
  static final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: DefaultElements.kPrimaryColor,
    height: 1.5,
  );

  static const defaultDuration = Duration(milliseconds: 250);

// Form Error
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";
}
