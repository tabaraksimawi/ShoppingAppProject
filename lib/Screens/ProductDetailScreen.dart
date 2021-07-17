import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Providers/providers.dart';
import './Core/core.dart';
import '../data/Models/CartModel.dart';
import '../data/Models/ProductModel.dart';
import './NoAccountWarning.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  final String heroTag;

  const ProductDetailScreen(
      {Key key, @required this.product, @required this.heroTag})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedIndex = 0;
  int selectedColorIndex = 0;
  CartModel cartModel;
  List<String> shoeShize = [
    "US 6",
    "US 7",
    "US 8",
    "US 9",
  ];

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    final _favProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "T",
                style: TextStyle(
                  color: DefaultElements.kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
              text: "J",
              style: TextStyle(
                color: DefaultElements.kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
        actions: [
          InkWell(
            onTap: () {
              displayNoAccountPageOr(
                  context: context,
                  orDoAction: () {
                    try {
                      _favProvider.addOrRemovefromFavorite(
                          product: widget.product);
                    } catch (e) {
                      showErrorMessage(e);
                    }
                  });
            },
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(right: 10),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  color: _favProvider.isFavorite(widget.product.id)
                      ? DefaultElements.kdefaultredcolor
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Visibility(
                visible: widget.product.showPersentage,
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: DefaultElements.kSecondryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${widget.product.discountPersentage}%",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              buildShoeShowcase(context),
              Spacer(),
              buildPriceSectionArea(context),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: DefaultElements.knavbariconcolor,
                      blurRadius: 2,
                      offset: Offset(0, -1),
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "${widget.product.price}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: TextButton(
                        onPressed: () {
                          try {
                            _cartProvider.addToCart(product: widget.product);
                            showSuccessMessage(
                                'The product has been added to your cart');
                          } catch (e) {
                            showErrorMessage(e);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/cart.svg",
                                height: 20,
                                color: DefaultElements.kPrimaryColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Add To Cart",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: DefaultElements.kPrimaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildShoeShowcase(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.75,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.product.showcasebgcolor,
                width: 2,
              )),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.75,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.product.showcasebgcolor,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.75,
                  decoration: BoxDecoration(
                    color: widget.product.showcasebgcolor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.75,
                      decoration: BoxDecoration(
                        color: widget.product.lightShowcasebgcolor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: Hero(
            tag: widget.heroTag,
            child: LoadImage(
              url: "${widget.product.productImage}",
            ),
          ),
        )
      ],
    );
  }

  buildPriceSectionArea(BuildContext contex) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: DefaultElements.knavbariconcolor,
                offset: Offset(0, -1),
                blurRadius: 2),
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${widget.product.productName}",
                    style: TextStyle(
                      fontSize: 30,
                      color: DefaultElements.kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 30,
                      color: Color(0xffFDD446),
                    ),
                    Text(
                      "${widget.product.avarrageRating}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Built for natural motion, the Nike Flex Shoes",
              style: TextStyle(
                fontSize: 18,
                color: DefaultElements.kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Size:",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.35,
                    child: Center(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: shoeShize.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: selectedIndex == index
                                  ? DefaultElements.kPrimaryColor
                                  : Colors.grey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                            ),
                            onPressed: () {
                              setState(() => selectedIndex = index);
                            },
                            child: Center(
                              child: Text(
                                shoeShize[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Available Color:",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColorIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedColorIndex == index
                                        ? DefaultElements
                                            .kshoerepplecolorOptions[index]
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: DefaultElements
                                            .kshoecolorOptions[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
