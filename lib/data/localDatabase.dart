import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './Models/CartModel.dart';
import 'Models/userModel.dart';

class LocalDatabase {
  ///store user offline
  static Future<void> setUser({
    @required UserModel user,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('currentUser', user.toJson());
  }

  static Future<UserModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('currentUser')) {
      final userJson = prefs.getString('currentUser');
      return UserModel.fromJson(userJson);
    } else {
      return null;
    }
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currentUser');
    prefs.remove('isLogedAsGuest');
  }

  static Future logInAsGuest({bool removeGuestMode = false}) async {
    final prefs = await SharedPreferences.getInstance();
    if (removeGuestMode) {
      await prefs.setBool('isLogedAsGuest', false);
    } else
      await prefs.setBool('isLogedAsGuest', true);
  }

  static Future<bool> isLogedAsGuest() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isLogedAsGuest')) {
      final isLogedAsGuest = prefs.getBool('isLogedAsGuest');
      return isLogedAsGuest;
    } else {
      return false;
    }
  }

  static Future<void> updateLocalCart({
    @required List<CartModel> cartItems,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringCartItems = [];
    for (var ci in cartItems) {
      stringCartItems.add(ci.toJson());
    }
    await prefs.setStringList('cartItems', stringCartItems);
  }

  static Future<List<CartModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('cartItems')) {
      final stringCartItems = prefs.getStringList('cartItems');
      return _cartListFromStringList(stringCartItems);
    } else {
      return [];
    }
  }

  static Future<void> clearLocalCart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('cartItems');
  }
}

Future<List<CartModel>> _cartListFromStringList(
    List<String> stringCartItems) async {
  List<CartModel> items = [];

  for (var cartItem in stringCartItems) {
    try {
      items.add(CartModel.fromJson(cartItem));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  return items;
}
