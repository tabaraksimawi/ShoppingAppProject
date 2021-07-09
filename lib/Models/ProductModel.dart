import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:myshopping_app/Component/DefaultElements.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String productImage;
  final String productName;
  final String price;
  String discountPersentage;
  String avarrageRating;
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
    this.discountPersentage,
    this.avarrageRating,
    this.showPersentage = false,
    this.showcasebgcolor,
    this.lightShowcasebgcolor,
    @required this.quantity,
  });

  ProductModel copyWith({
    String id,
    List<String> categories,
    String productImage,
    String productName,
    String price,
    bool isFavorite,
    String discountPersentage,
    String avarrageRating,
    bool showPersentage,
    Color showcasebgcolor,
    Color lightShowcasebgcolor,
    int quantity,
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
    };
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, categories: $categories, productImage: $productImage, productName: $productName, price: $price, discountPersentage: $discountPersentage, avarrageRating: $avarrageRating, showPersentage: $showPersentage, showcasebgcolor: $showcasebgcolor, lightShowcasebgcolor: $lightShowcasebgcolor, quantity: $quantity)';
  }

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
        other.quantity == quantity;
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
        quantity.hashCode;
  }
}

List<ProductModel> shoeListModel = [
  ProductModel(
    id: '1',
    quantity: 100,
    showcasebgcolor: DefaultElements.kshoebgcolorpink,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorpink,
    productImage: "assets/images/shoe1.png",
    discountPersentage: "30%",
    categories: ['shoes'],
    productName: "Nike Air Max 20",
    price: "240.00",
    avarrageRating: "(4.5)",
    showPersentage: true,
  ),
  ProductModel(
    id: '2',
    quantity: 100,
    showcasebgcolor: DefaultElements.kshoebgcolorblue,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
    productImage: "assets/images/shoe2.png",
    discountPersentage: "30%",
    productName: "Excee Sneakers",
    price: "260.00",
    categories: ['shoes'],
    avarrageRating: "(3.0)",
    showPersentage: false,
  ),
  ProductModel(
    id: '3',
    quantity: 100,
    showcasebgcolor: DefaultElements.kshoebgcolorgreen,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorgreen,
    productImage: "assets/images/shoe3.png",
    discountPersentage: "30%",
    productName: "Air Max Motions 2",
    categories: ['shoes'],
    price: "290.00",
    avarrageRating: "(3.0)",
    showPersentage: false,
  ),
  ProductModel(
    id: '4',
    quantity: 100,
    showcasebgcolor: DefaultElements.kshoebgcoloryellow,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcoloryellow,
    productImage: "assets/images/shoe4.png",
    discountPersentage: "40%",
    productName: "Leather Sneakers",
    price: "270.00",
    categories: ['shoes'],
    avarrageRating: "(4.5)",
    showPersentage: true,
  ),
];
