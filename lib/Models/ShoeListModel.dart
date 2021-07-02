import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:flutter/foundation.dart';

class ShoeListModel with ChangeNotifier {
  final String id;
  final String Category;
  final String shoeimage;
  final String shoeName;
  final String price;
  bool isFavorite;
  String persentage;
  String rating;
  bool showpersentage;
  Color showcasebgcolor;
  Color lightShowcasebgcolor;
  int shoeQuantity;

  ShoeListModel({
    @required this.id,
    @required this.Category,
    @required this.shoeimage,
    @required this.shoeName,
    @required this.price,
    this.persentage,
    this.rating,
    this.showpersentage = false,
    this.showcasebgcolor,
    this.lightShowcasebgcolor,
    this.isFavorite,
    this.shoeQuantity,
  });

  void _setFavValue(bool newValue)
  {
    isFavorite = newValue;
    notifyListeners();
  }
  //Future<void> toggleFavoriteStatus( String token, String userId)
}
List<ShoeListModel> shoeListModel = [
    ShoeListModel(
      id: '1',
      showcasebgcolor: DefaultElements.kshoebgcolorpink,
      lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorpink,
      shoeimage: "assets/images/shoe1.png",
      persentage: "30%",
      shoeName: "Nike Air Max 20",
      price: "\$" + "240.00",
      rating: "(4.5)",
      showpersentage: true,
    ),
    ShoeListModel(
      id: '2',
      showcasebgcolor: DefaultElements.kshoebgcolorblue,
      lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
      shoeimage: "assets/images/shoe2.png",
      persentage: "30%",
      shoeName: "Excee Sneakers",
      price: "\$" + "260.00",
      rating: "(3.0)",
      showpersentage: false,
    ),
    ShoeListModel(
      id: '3',
      showcasebgcolor: DefaultElements.kshoebgcolorgreen,
      lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorgreen,
      shoeimage: "assets/images/shoe3.png",
      persentage: "30%",
      shoeName: "Air Max Motions 2",
      price: "\$" + "290.00",
      rating: "(3.0)",
      showpersentage: false,
    ),
    ShoeListModel(
      id: '4',
      showcasebgcolor: DefaultElements.kshoebgcoloryellow,
      lightShowcasebgcolor: DefaultElements.lightShowcasebgcoloryellow,
      shoeimage: "assets/images/shoe4.png",
      persentage: "40%",
      shoeName: "Leather Sneakers",
      price: "\$" + "270.00",
      rating: "(4.5)",
      showpersentage: true,
    ),
];
