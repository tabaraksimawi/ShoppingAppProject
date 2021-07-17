import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/Models/ProductModel.dart';
import '../Providers/providers.dart';
import './Core/Component/DefaultElements.dart';
import './Core/imageLoader.dart';
import './ProductDetailScreen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final String heroTag;

  const ProductCard({Key key, this.product, this.heroTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isFav = Provider.of<FavoriteProvider>(context).isFavorite(product.id);

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                          product: product, heroTag: heroTag)));
            },
            child: Container(
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
                        product.showPersentage
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 8, left: 8),
                                child: Container(
                                  height: 20,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: DefaultElements.kSecondryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${product.discountPersentage}%",
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
                                height: 20,
                                color: isFav
                                    ? DefaultElements.kdefaultredcolor
                                    : Colors.grey),
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
                          color: product.showcasebgcolor,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            // height: 120,
                            // width: 120,
                            decoration: BoxDecoration(
                                color: product.showcasebgcolor,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Hero(
                          tag: "$heroTag",
                          child: LoadImage(
                            url: "${product.productImage}",
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${product.productName}",
                    style: TextStyle(
                      color: DefaultElements.kPrimaryColor,
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
                      "${product.price}",
                      style: TextStyle(
                        color: DefaultElements.kPrimaryColor,
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
