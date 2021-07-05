import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../SizeConfig.dart';
import 'Constatns.dart';
import 'DefaultElements.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color:Color(0xfff1f0f4),
        elevation: 2.0,
        onPressed: press,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
            color: DefaultElements.kprimarycolor,

          ),
        ),
      ),
    ),
    );
  }
}
