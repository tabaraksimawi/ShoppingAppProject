import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/defaultElements.dart';
class WatchesListModel {

  String watchimage;
  String persentage;
  String watchName;
  String price;
  String rating;
  bool showpersentage;
  bool activeheart;
  Color showcasebgcolor;
  Color lightShowcasebgcolor;

  WatchesListModel({
    this.watchimage,
    this.persentage,
    this.watchName,
    this.price,
    this.rating,
    this.showpersentage = false,
    this.activeheart = false,
    this.showcasebgcolor,
    this.lightShowcasebgcolor,
  });
}

List<WatchesListModel> watchesListModel = [
  WatchesListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorpink,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorpink,
    watchimage: "assets/images/watch1.png",
    persentage: "30%",
    watchName: "fit 20",
    price: "\$" + "240.00",
    rating: "(4.5)",
    showpersentage: true,
    activeheart: false,
  ),
  WatchesListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorblue,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
    watchimage: "assets/images/watch2.png",
    persentage: "30%",
    watchName: "sport watch",
    price: "\$" + "260.00",
    rating: "(3.0)",
    showpersentage: false,
    activeheart: true,
  ),
  WatchesListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorgreen,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorgreen,
    watchimage: "assets/images/watch3.png",
    persentage: "30%",
    watchName: " Motions 2",
    price: "\$" + "290.00",
    rating: "(3.0)",
    showpersentage: false,
    activeheart: false,
  ),
  WatchesListModel(
    showcasebgcolor: DefaultElements.kshoebgcoloryellow,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcoloryellow,
    watchimage: "assets/images/watch4.png",
    persentage: "40%",
    watchName: "casio world time",
    price: "\$" + "270.00",
    rating: "(4.5)",
    showpersentage: true,
    activeheart: false,
  ),
];
