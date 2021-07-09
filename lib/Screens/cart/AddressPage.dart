import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myshopping_app/Component/DefaultButton.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:myshopping_app/Component/defaultInputFeild.dart';

import 'PaymentPage.dart';

class AddressPage extends StatelessWidget {
  static String routeName = "/address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: AddressPageBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DefaultButton(
          onPressed: () {
            Navigator.of(context).pushNamed(PaymentPage.routeName);
          },
          text: 'Continue',
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(color: DefaultElements.kprimarycolor),
      elevation: 0.2,
      backgroundColor: DefaultElements.kdefaultbgcolor,
      title: Column(
        children: [
          Text(
            "Address",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: DefaultElements.kprimarycolor, letterSpacing: .5),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressPageBody extends StatefulWidget {
  @override
  _AddressPageBodyState createState() => _AddressPageBodyState();
}

class _AddressPageBodyState extends State<AddressPageBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adress Information',
                style: GoogleFonts.lato(fontSize: 28),
              ),
              SizedBox(height: 30),
              DefaultInputFeild(
                  lableText: 'Addess 1',
                  hintText: 'Baghdad / Karradah / st. 62'),
              SizedBox(height: 20),
              DefaultInputFeild(lableText: 'Addess 2', hintText: 'Optional'),
              SizedBox(height: 20),
              DefaultInputFeild(lableText: 'City'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: DefaultInputFeild(lableText: 'State'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: DefaultInputFeild(lableText: 'ZIP Code'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
