import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/Constatns.dart';
import 'package:google_fonts/google_fonts.dart';
import '../SizeConfig.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text("Shopping App",
          style: GoogleFonts.sriracha (textStyle: TextStyle(color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(40),
          )
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
