import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Providers/providers.dart';
import '../Core/core.dart';
import '../../data/Models/FavoriteModel.dart';
import './components/favoriteCard.dart';
import '../NoAccountWarning.dart';

class FavoriteBody extends StatefulWidget {
  @override
  _FavoriteBodyState createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  List<Favorite> selectedItems = [];
  UserProvider _userProvider;
  FavoriteProvider _favProvider;
  CartProvider _cartProvider;
  @override
  void didChangeDependencies() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _favProvider = Provider.of<FavoriteProvider>(context);
    _cartProvider = Provider.of<CartProvider>(context);
    selectedItems.addAll(_favProvider.favorites);
    super.didChangeDependencies();
  }

  bool isAllSelected = true;
  @override
  Widget build(BuildContext context) {
    final _favorites = _favProvider.favorites;

    return _userProvider.isGuest
        ? NoAccountWarningWidget()
        : _favProvider.controllerState == ControllerState.loading
            ? LoadingDialog()
            : _favorites.isEmpty
                ? EmptyListWidget()
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
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
                                value:
                                    selectedItems.length == _favorites.length,
                                visualDensity: VisualDensity.compact,
                                activeColor: DefaultElements.kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (value) {
                                      selectedItems.addAll(_favorites);
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
                            itemCount: _favorites.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Dismissible(
                                key: Key(_favorites[index].id.toString()),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  _favProvider.addOrRemovefromFavorite(
                                      product: _favorites[index].product);
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
                                      SvgPicture.asset(
                                          "assets/icons/Trash.svg"),
                                    ],
                                  ),
                                ),
                                child: FavoriteCard(
                                  product: _favorites[index].product,
                                  isSelected: selectedItems.any((e) =>
                                      e.product.id ==
                                      _favorites[index].product.id),
                                  onCheckBoxValueChanged: (value) {
                                    setState(() {
                                      if (value) {
                                        selectedItems.add(_favorites[index]);
                                      } else {
                                        selectedItems.remove(_favorites[index]);
                                      }
                                    });
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
                          onPressed: selectedItems.isEmpty ||
                                  _cartProvider.controllerState ==
                                      ControllerState.loading
                              ? null
                              : () async {
                                  for (var f in selectedItems) {
                                    await _cartProvider.addToCart(
                                        product: f.product);
                                  }

                                  showSuccessMessage(
                                      "Items has been successfully added to cart");
                                },
                          text: "Add To Cart",
                          preffixIcon: _cartProvider.controllerState ==
                                  ControllerState.loading
                              ? CircularProgressIndicator.adaptive()
                              : SvgPicture.asset(
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
