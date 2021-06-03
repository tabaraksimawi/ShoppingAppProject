import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/defaultElements.dart';
class BagsListModel {
  String bagimage;
  String persentage;
  String bagName;
  String price;
  String rating;
  bool showpersentage;
  bool activeheart;
  Color showcasebgcolor;
  Color lightShowcasebgcolor;

  BagsListModel({
    this.bagimage,
    this.persentage,
    this.bagName,
    this.price,
    this.rating,
    this.showpersentage = false,
    this.activeheart = false,
    this.showcasebgcolor,
    this.lightShowcasebgcolor,
  });
}

List<BagsListModel> bagsListModel = [
  BagsListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorpink,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorpink,
    bagimage: "assets/images/bp1.png",
    persentage: "30%",
    bagName: "fit 20",
    price: "\$" + "240.00",
    rating: "(4.5)",
    showpersentage: true,
    activeheart: false,
  ),
  BagsListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorblue,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
    bagimage: "assets/images/bp2.png",
    persentage: "30%",
    bagName: "sport watch",
    price: "\$" + "260.00",
    rating: "(3.0)",
    showpersentage: false,
    activeheart: true,
  ),
  BagsListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorgreen,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorgreen,
    bagimage: "assets/images/bp3.png",
    persentage: "30%",
    bagName: " Motions 2",
    price: "\$" + "290.00",
    rating: "(3.0)",
    showpersentage: false,
    activeheart: false,
  ),
  BagsListModel(
    showcasebgcolor: DefaultElements.kshoebgcoloryellow,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcoloryellow,
    bagimage: "assets/images/bp4.png",
    persentage: "40%",
    bagName: "casio world time",
    price: "\$" + "270.00",
    rating: "(4.5)",
    showpersentage: true,
    activeheart: false,
  ),
];
