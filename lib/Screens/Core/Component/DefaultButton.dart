import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SizeConfig.dart';
import './DefaultElements.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.preffixIcon,
  }) : super(key: key);
  final String text;
  final Function onPressed;
  final Widget preffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: DefaultElements.kPrimaryColor,
          elevation: 2.0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: preffixIcon ?? Container(),
            ),
            Text(
              text,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
