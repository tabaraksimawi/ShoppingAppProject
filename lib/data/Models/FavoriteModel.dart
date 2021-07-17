import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './ProductModel.dart';

class Favorite {
  String id;
  ProductModel product;

  Favorite({
    @required this.id,
    @required this.product,
  });

  Favorite copyWith({
    String id,
    ProductModel product,
    String userId,
  }) {
    return Favorite(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  /// It is a specific function to convert a favorite model to a map for storage
  /// in Firebase since you shouldn't store the product map in the database again,
  /// instead you should just store its id and retrieve it
  /// from the products collection later
  Map<String, dynamic> toDocMap() {
    return {
      'id': id,
      'productId': product.id,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
    };
  }

  factory Favorite.fromDocument(DocumentSnapshot doc, ProductModel product) {
    return Favorite(
      product: product,
      id: doc.id,
    );
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'],
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(id: $id, product: $product)';

  ///for more: https://api.dart.dev/stable/2.13.4/dart-core/Object/operator_equals.html
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favorite && other.id == id && other.product == product;
  }

  @override
  int get hashCode => id.hashCode ^ product.hashCode;
}
