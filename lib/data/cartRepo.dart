import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import './productRepo.dart';
import './Models/CartModel.dart';
import './checkConnection.dart';

class CartRepo {
  CartRepo(String userId) {
    _onInit(userId);
  }

  ///to initialize [_userCartCollection] with access to user doc and his cart so you
  ///don't have to get user id each time you want to do something with the user's cart
  _onInit(String userId) async {
    _userCartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart');
  }

  CollectionReference _userCartCollection;

  Future<CartModel> addToCart({@required CartModel cartItem}) async {
    if (!await connected()) throw 'No Internet Connection';

    try {
      final docRef = _userCartCollection.doc(cartItem.cartItemId);
      docRef.set(cartItem.toDocMap());
      return cartItem;
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  Future<void> removeFromCart(String cartItemId) async {
    if (!await connected()) throw 'No Internet Connection';
    try {
      await _userCartCollection.doc(cartItemId).delete();
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  ///you want to update the item when the order quantity is increased
  ///other than that you shouldn't use this function
  Future<void> updateCartItem({@required CartModel cartItem}) async {
    if (!await connected()) throw 'No Internet Connection';

    try {
      await _userCartCollection
          .doc(cartItem.cartItemId)
          .set(cartItem.toDocMap());
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  Future<List<CartModel>> getCartItems() async {
    if (!await connected()) throw 'No Internet Connection';

    QuerySnapshot cartSnapshot;
    try {
      cartSnapshot = await _userCartCollection.get();

      if (cartSnapshot.docs.isNotEmpty) {
        final items = await _cartListFromSnapshot(cartSnapshot);
        return items;
      } else
        return [];
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  Future<void> clearCart() async {
    try {
      var snapshots = await _userCartCollection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  ///this function receives [QuerySnapshot] snapshot and
  ///performs a loop on every cart document in the snapshot to get the product Data of each item
  ///and convert the cart document to cart model
  Future<List<CartModel>> _cartListFromSnapshot(QuerySnapshot snap) async {
    List<CartModel> items = [];

    for (var doc in snap.docs) {
      try {
        final productDoc = await ProductsRepo.getProductData(doc['productId']);
        items.add(CartModel.fromDocument(doc, productDoc));
      } catch (e) {
        print(e);
        rethrow;
      }
    }
    return items;
  }
}
