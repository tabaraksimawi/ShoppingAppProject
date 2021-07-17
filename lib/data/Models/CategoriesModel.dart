import 'package:flutter/material.dart';

class CategoriesModel {
  final String image;
  final String title;

  CategoriesModel({@required this.image, @required this.title}); //constructor
}

List<CategoriesModel> categoriesModel = [
  CategoriesModel(
    image: "assets/icons/menu.svg",
    title: "All",
  ),
  CategoriesModel(
    image: "assets/icons/shoes.svg",
    title: "Sneakers",
  ),
  CategoriesModel(
    image: "assets/icons/watch.svg",
    title: "watches",
  ),
  CategoriesModel(
    image: "assets/icons/backpack.svg",
    title: "Backpack",
  ),
];
