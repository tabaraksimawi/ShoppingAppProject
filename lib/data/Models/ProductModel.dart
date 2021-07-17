import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String productImage;
  final String productName;
  final double price;
  final int numberOfPurchases;
  int discountPersentage;
  double avarrageRating;
  bool showPersentage;
  Color showcasebgcolor;
  Color lightShowcasebgcolor;
  int quantity;

  ProductModel({
    @required this.id,
    @required this.categories,
    @required this.productImage,
    @required this.productName,
    @required this.price,
    @required this.quantity,
    @required this.numberOfPurchases,
    this.discountPersentage,
    this.avarrageRating,
    this.showPersentage = false,
    this.showcasebgcolor,
    this.lightShowcasebgcolor,
  });

  ProductModel copyWith({
    String id,
    List<String> categories,
    String productImage,
    String productName,
    String price,
    String discountPersentage,
    String avarrageRating,
    bool showPersentage,
    Color showcasebgcolor,
    Color lightShowcasebgcolor,
    int quantity,
    int numberOfPurchases,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      productImage: productImage ?? this.productImage,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      discountPersentage: discountPersentage ?? this.discountPersentage,
      avarrageRating: avarrageRating ?? this.avarrageRating,
      showPersentage: showPersentage ?? this.showPersentage,
      showcasebgcolor: showcasebgcolor ?? this.showcasebgcolor,
      lightShowcasebgcolor: lightShowcasebgcolor ?? this.lightShowcasebgcolor,
      quantity: quantity ?? this.quantity,
      numberOfPurchases: numberOfPurchases ?? this.numberOfPurchases,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories': categories,
      'productImage': productImage,
      'productName': productName,
      'price': price,
      'discountPersentage': discountPersentage,
      'avarrageRating': avarrageRating,
      'showPersentage': showPersentage,
      'showcasebgcolor': showcasebgcolor.value,
      'lightShowcasebgcolor': lightShowcasebgcolor.value,
      'quantity': quantity,
      'numberOfPurchases': numberOfPurchases,
    };
  }

  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    return ProductModel(
      id: doc.id,
      categories: List<String>.from(doc['categories']),
      productImage: doc['productImage'],
      productName: doc['productName'],
      price: doc['price'],
      discountPersentage: doc['discountPersentage'],
      avarrageRating: doc['avarrageRating'],
      showPersentage: doc['showPersentage'],
      showcasebgcolor: Color(doc['showcasebgcolor']),
      lightShowcasebgcolor: Color(doc['lightShowcasebgcolor']),
      quantity: doc['quantity'],
      numberOfPurchases: doc['numberOfPurchases'],
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      categories: List<String>.from(map['categories']),
      productImage: map['productImage'],
      productName: map['productName'],
      price: map['price'],
      discountPersentage: map['discountPersentage'],
      avarrageRating: map['avarrageRating'],
      showPersentage: map['showPersentage'],
      showcasebgcolor: Color(map['showcasebgcolor']),
      lightShowcasebgcolor: Color(map['lightShowcasebgcolor']),
      quantity: map['quantity'],
      numberOfPurchases: map['numberOfPurchases'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, categories: $categories, productImage: $productImage, productName: $productName, price: $price, discountPersentage: $discountPersentage, avarrageRating: $avarrageRating, showPersentage: $showPersentage, showcasebgcolor: $showcasebgcolor, lightShowcasebgcolor: $lightShowcasebgcolor, quantity: $quantity, numberOfPurchases: $numberOfPurchases)';
  }

  ///for more: https://api.dart.dev/stable/2.13.4/dart-core/Object/operator_equals.html
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        listEquals(other.categories, categories) &&
        other.productImage == productImage &&
        other.productName == productName &&
        other.price == price &&
        other.discountPersentage == discountPersentage &&
        other.avarrageRating == avarrageRating &&
        other.showPersentage == showPersentage &&
        other.showcasebgcolor == showcasebgcolor &&
        other.lightShowcasebgcolor == lightShowcasebgcolor &&
        other.quantity == quantity &&
        other.numberOfPurchases == numberOfPurchases;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categories.hashCode ^
        productImage.hashCode ^
        productName.hashCode ^
        price.hashCode ^
        discountPersentage.hashCode ^
        avarrageRating.hashCode ^
        showPersentage.hashCode ^
        showcasebgcolor.hashCode ^
        lightShowcasebgcolor.hashCode ^
        quantity.hashCode ^
        numberOfPurchases.hashCode;
  }
}
