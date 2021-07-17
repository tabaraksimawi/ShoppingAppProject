import 'package:flutter/material.dart';

import '../Core/Component/DefaultElements.dart';
import './components/body.dart';
import './components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: DefaultElements.headingStyle,
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
