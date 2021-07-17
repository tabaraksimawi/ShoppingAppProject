import 'package:flutter/material.dart';
import '../../Providers/providers.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Core/core.dart';
import '../productCard.dart';
import '../../data/Models/CategoriesModel.dart';
import '../Search/Search.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedCategory = 'All';
  ProductsProvider _productsProvider;

  @override
  Widget build(BuildContext context) {
    _productsProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: DefaultElements.kdefaultbgcolor,
      body: RefreshIndicator(
        onRefresh: () async {
          _productsProvider.getProducts();
        },
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: _productsProvider.initError != null,
              child: Container(
                height: 20,
                color: DefaultElements.kdefaultredcolor,
                child: Text(
                  _productsProvider.initError ?? '',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            buildRecomendedItems(),
            buildProductSection(),

            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
              color: DefaultElements.kSecondryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Search()));
            },
            icon: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              height: 25,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductSection() {
    final _desierdProducts = selectedCategory == 'All'
        ? _productsProvider.products
        : _productsProvider.products
            .where((p) => p.categories.contains(selectedCategory))
            .toList();
    _desierdProducts
        .sort((a, b) => b.avarrageRating.compareTo(a.avarrageRating));
    return _productsProvider.controllerState == ControllerState.loading
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Text(
                  "Our Products",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildCategoriesSection(context),
              SizedBox(height: 5),
              SizedBox(
                height: SizeConfig.screenHeight *
                    (_desierdProducts.length / 2).round() *
                    0.3,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: _desierdProducts.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        product: _desierdProducts[index],
                        heroTag:
                            '${_desierdProducts[index].productImage}Our_Products',
                      ),
                    )),
              ),
            ],
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
            int selectedIndex =
                categoriesModel.indexWhere((c) => c.title == selectedCategory);
            return GestureDetector(
              onTap: () {
                setState(() => selectedCategory = categoriesModel[index].title);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? DefaultElements.kPrimaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "${categoriesModel[index].image}",
                        height: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "${categoriesModel[index].title}",
                        style: TextStyle(
                          color: selectedIndex != index
                              ? DefaultElements.kPrimaryColor
                              : Colors.white,
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
        ));
  }

  buildRecomendedItems() {
    final firstFour = _productsProvider.products.take(4).toList();
    return _productsProvider.controllerState == ControllerState.loading
        ? LoadingDialog(bgColor: Colors.transparent)
        : SizedBox(
            height: SizeConfig.screenHeight * 0.35,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Top Items",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: firstFour.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                          product: firstFour[index],
                          heroTag: '${firstFour[index].productImage}Top_Items',
                        );
                      },
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
