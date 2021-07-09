import 'dart:convert';

import 'package:myshopping_app/Models/ProductModel.dart';

class Cart {
  final ProductModel product;
  final int quantity;

  Cart({
    this.product,
    this.quantity,
  });

  Cart copyWith({
    ProductModel product,
    int quantity,
  }) {
    return Cart(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: ProductModel.fromMap(map['product']),
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}

// Demo data for our cart
List<Cart> demoCarts = [
  Cart(product: shoeListModel[0], quantity: 2),
  Cart(product: shoeListModel[1], quantity: 1),
  Cart(product: shoeListModel[2], quantity: 1),
];
