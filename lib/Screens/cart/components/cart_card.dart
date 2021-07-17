import 'package:flutter/material.dart';

import '../../../Providers/providers.dart';
import '../../Core/core.dart';
import '../../../data/Models/CartModel.dart';
import '../../ProductDetailScreen.dart';
import '../../NoAccountWarning.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: cart.product,
                heroTag: '${cart.product.productImage}',
              ),
            ));
      },
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: cart.product.productImage,
                  child: LoadImage(url: cart.product.productImage),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.productName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: DefaultElements.kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${cart.quantity}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  displayNoAccountPageOr(
                      context: context,
                      orDoAction: () {
                        try {
                          favoriteProvider.addOrRemovefromFavorite(
                              product: cart.product);
                        } catch (e) {
                          showErrorMessage(e);
                        }
                      });
                },
                icon: Icon(
                  favoriteProvider.isFavorite(cart.product.id)
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: DefaultElements.kPrimaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
