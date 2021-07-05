import 'package:flutter/material.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
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
      leading: BackButton(
          color: DefaultElements.kprimarycolor
      ),
      elevation: 0.2,
      backgroundColor: DefaultElements.kdefaultbgcolor,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: DefaultElements.kprimarycolor),
          ),
          Text(
            "${shoeListModel.length} items",
            style: TextStyle(color: DefaultElements.kprimarycolor,fontSize: 12),
          ),
        ],
      ),
    );
  }
}
