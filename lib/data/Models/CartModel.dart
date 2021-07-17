import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import './ProductModel.dart';

class CartModel {
  final ProductModel product;
  final int quantity;
  final String cartItemId;

  CartModel({
    this.product,
    this.quantity,
    this.cartItemId,
  });

  CartModel copyWith({
    ProductModel product,
    int quantity,
    String cartItemId,
    String userId,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      cartItemId: cartItemId ?? this.cartItemId,
    );
  }

  /// It is a specific function to convert a cart model to a map for storage
  /// in Firebase since you shouldn't store the product map in the database again,
  /// instead you should just store its id and retrieve it
  /// from the products collection later
  Map<String, dynamic> toDocMap() {
    return {
      'productId': product.id,
      'quantity': quantity,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
      'cartItemId': cartItemId,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      product: ProductModel.fromMap(map['product']),
      quantity: map['quantity'],
      cartItemId: map['cartItemId'],
    );
  }

  factory CartModel.fromDocument(DocumentSnapshot doc, ProductModel product) {
    return CartModel(
      product: product,
      quantity: doc['quantity'],
      cartItemId: doc.id,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CartModel(product: $product, quantity: $quantity, cartItemId: $cartItemId)';

  ///for more: https://api.dart.dev/stable/2.13.4/dart-core/Object/operator_equals.html
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.product == product &&
        other.quantity == quantity &&
        other.cartItemId == cartItemId;
  }

  @override
  int get hashCode =>
      product.hashCode ^ quantity.hashCode ^ cartItemId.hashCode;
}
