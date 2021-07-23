import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import './Models/FavoriteModel.dart';
import './productRepo.dart';
import './checkConnection.dart';

class FavoriteRepo {
  FavoriteRepo(String userId) {
    _onInit(userId);
  }

  ///to initalize [_userFavoritesCollection] with access to user doc and his Favorites so you
  ///don't have to get user id each time you want to do something with the user's cart
  _onInit(String userId) async {
    _userFavoritesCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favorites');
  }

  CollectionReference _userFavoritesCollection;

  Future<Favorite> addToFavorite({@required Favorite favorite}) async {
    if (!await connected()) throw 'No Internet Connection';

    try {
      final docRef = _userFavoritesCollection.doc(favorite.id);
      docRef.set(favorite.toDocMap());
      return favorite;
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  Future<void> removeFromFavorites(String favoriteId) async {
    if (!await connected()) throw 'No Internet Connection';
    try {
      await _userFavoritesCollection.doc(favoriteId).delete();
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  Future<List<Favorite>> getUserFavorites() async {
    if (!await connected()) throw 'No Internet Connection';

    QuerySnapshot favSnapshot;
    try {
      favSnapshot = await _userFavoritesCollection.get();

      if (favSnapshot.docs.isNotEmpty) {
        final items = await _favoritesListFromSnapshot(favSnapshot);
        return items;
      } else
        return [];
    } catch (e) {
      print(e);
      throw 'Unknown error, please try again later';
    }
  }

  ///this function receives [QuerySnapshot] snapshot and
  ///performs a loop on every Favorite document in
  ///the snapshot to get the product Data of each Favorite item
  ///and convert the Favorite document to Favorite model
  Future<List<Favorite>> _favoritesListFromSnapshot(QuerySnapshot snap) async {
    List<Favorite> items = [];

    for (var doc in snap.docs) {
      try {
        final productDoc = await ProductsRepo.getProductData(doc['productId']);
        items.add(Favorite.fromDocument(doc, productDoc));
        return items;
      } catch (e) {
        print(e);
        rethrow;
      }
    }
    return items;
  }
}
