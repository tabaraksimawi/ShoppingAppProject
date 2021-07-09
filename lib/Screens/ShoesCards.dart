import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshopping_app/Component/defaultElements.dart';
import 'package:myshopping_app/Models/ProductModel.dart';

import 'DetailsScreen.dart';

class ShoesCards extends StatelessWidget {
  final ProductModel shoeListModel;
  final int index;

  const ShoesCards({Key key, this.shoeListModel, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(productModel: shoeListModel)));
              print("Navigate to Detail Page");
            },
            child: Container(
              // height: 220,
              // width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: DefaultElements.knavbariconcolor,
                      offset: Offset(0, -1),
                      blurRadius: 10)
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4, left: 4),
                    child: Row(
                      children: [
                        shoeListModel.showPersentage
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 8, left: 8),
                                child: Container(
                                  height: 20,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: DefaultElements.ksecondrycolor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${shoeListModel.discountPersentage}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        Spacer(),
                        Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Center(
                            child: SvgPicture.asset("assets/icons/heart.svg",
                                height: 20, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: shoeListModel.showcasebgcolor,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            // height: 120,
                            // width: 120,
                            decoration: BoxDecoration(
                                color: shoeListModel.showcasebgcolor,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 5,
                        left: 0,
                        child: Hero(
                          tag: "${shoeListModel.productImage}",
                          child: Image.asset(
                            "${shoeListModel.productImage}",
                            height: 60,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${shoeListModel.productName}",
                    style: TextStyle(
                      color: DefaultElements.kprimarycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "${shoeListModel.price}",
                      style: TextStyle(
                        color: DefaultElements.kprimarycolor,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
