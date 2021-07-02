import 'package:flutter/material.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "${shoeListModel.length} items",
            style: TextStyle(color: Colors.white,fontSize: 12),
          ),
        ],
      ),
    );
  }
}
