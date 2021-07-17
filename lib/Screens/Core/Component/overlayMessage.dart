import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './DefaultElements.dart';

void showSuccessMessage(String message) {
  BotToast.showText(
    text: message,
    duration: Duration(seconds: 2),
    textStyle: GoogleFonts.lato(fontSize: 18, color: Colors.white),
  );
}

void showErrorMessage(String message) {
  BotToast.showText(
    text: message,
    contentColor: DefaultElements.kdefaultredcolor,
    duration: Duration(seconds: 2),
    textStyle: GoogleFonts.lato(fontSize: 18, color: Colors.white),
  );
}
