import 'package:flutter/material.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';


class Cart {
  final ShoeListModel product;
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: shoeListModel[0], numOfItem: 2),
  Cart(product: shoeListModel[1], numOfItem: 1),
  Cart(product: shoeListModel[3], numOfItem: 1),
];

