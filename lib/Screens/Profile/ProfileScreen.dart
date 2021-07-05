import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/NavBar.dart';
import '../enum.dart';
import 'ProfileBody.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: DefaultElements.kprimarycolor
        ),
        elevation: 0.2,
        backgroundColor: DefaultElements.kdefaultbgcolor,


        title: Text("Profile",
        style: GoogleFonts.lato(textStyle: TextStyle(color: DefaultElements.kprimarycolor, letterSpacing: .5),),
      ),),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}