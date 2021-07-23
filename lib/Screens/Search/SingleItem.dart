import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/Core/Component/DefaultElements.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String productImage;
  String productName;
  double price;
  SingleItem(
      {this.isBool, this.productImage, this.productName, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Center(
                    child: Image.network(
                      productImage,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "$price\$",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "color",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: DefaultElements.kPrimaryColor,
                              ),
                            )
                          ],
                        ),
                      )
                          : Text("red")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: DefaultElements.kPrimaryColor,
                            size: 20,
                          ),
                          Text(
                            "ADD",
                            style: TextStyle(
                              color: DefaultElements.kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      : Column(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: DefaultElements.kPrimaryColor,
                                size: 20,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(
                                  color: DefaultElements.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }
}