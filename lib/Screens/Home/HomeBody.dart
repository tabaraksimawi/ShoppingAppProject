import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';
import 'package:myshopping_app/Screens/ShoesCards.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myshopping_app/Models/CategoriesModel.dart';
 class Body extends StatefulWidget {
   @override
   _BodyState createState() => _BodyState();
 }

 class _BodyState extends State<Body> {
   int selectedIndex = 0;
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultElements.kdefaultbgcolor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(),
              buildProductSection(),
              SizedBox(
                height: 20,
              ),
              buildCategoriesSection(context),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: shoeListModel.length,
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ShoesCards(
                        shoeListModel: shoeListModel[index],
                        index: index,
                      ),
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildAppBar() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Row(
          children: [
            Expanded(
              child: Container(),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "X",
                    style: TextStyle(
                      color: DefaultElements.kprimarycolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text: "E",
                  style: TextStyle(
                    color: DefaultElements.ksecondrycolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(),
            ),
            SvgPicture.asset(
              "assets/icons/search_icon.svg",
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildProductSection() {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 10, right: 25),
      child: Row(
        children: [
          Text(
            "Our Products",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  buildCategoriesSection(BuildContext context) {
    return Container(
        height: 35,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: categoriesModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        selectedIndex == index
                            ? BoxShadow(
                            color: DefaultElements.knavbariconcolor,
                            blurRadius: 10,
                            offset: Offset(0, -1))
                            : BoxShadow()
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "${categoriesModel[index].image}",
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${categoriesModel[index].title}",
                        style: TextStyle(
                          color: selectedIndex == index
                              ? DefaultElements.kprimarycolor
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}

