import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myshopping_app/Component/Constatns.dart';
import 'package:myshopping_app/Component/DefaultButton.dart';
import 'package:myshopping_app/Models/ProductModel.dart';
import 'package:myshopping_app/Screens/Favorite/components/favoriteCard.dart';

import '../../SizeConfig.dart';

class FavoriteBody extends StatefulWidget {
  @override
  _FavoriteBodyState createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  List<ProductModel> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems.addAll(shoeListModel);
  }

  bool isAllSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select All',
                style: GoogleFonts.lato(fontSize: 18),
              ),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: selectedItems.length == shoeListModel.length,
                  visualDensity: VisualDensity.compact,
                  activeColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value) {
                        selectedItems.addAll(shoeListModel);
                      } else {
                        selectedItems.clear();
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: shoeListModel.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(shoeListModel[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      shoeListModel.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: FavoriteCard(
                    product: shoeListModel[index],
                    isSelected: selectedItems.contains(shoeListModel[index]),
                    onCheckBoxValueChanged: (value) {
                      print(selectedItems.length);
                      print(shoeListModel.length);
                      print(value);
                      setState(() {
                        if (value) {
                          selectedItems.add(shoeListModel[index]);
                        } else {
                          selectedItems.remove(shoeListModel[index]);
                        }
                      });
                      print(selectedItems.length);
                      print(shoeListModel.length);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultButton(
            onPressed: () {
              BotToast.showText(
                text: "Items has been successfully added to cart",
                textStyle: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              );
            },
            text: "Add To Cart",
            preffixIcon: SvgPicture.asset(
              "assets/icons/cart.svg",
              height: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
