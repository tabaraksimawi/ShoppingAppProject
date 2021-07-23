import 'package:flutter/cupertino.dart';
import 'package:myshopping_app/Providers/providers.dart';
import 'package:uuid/uuid.dart';

import './state.dart';
import '../data/cartRepo.dart';
import '../data/localDatabase.dart';
import '../data/Models/CartModel.dart';
import '../data/Models/ProductModel.dart';
import '../Screens/Core/Component/overlayMessage.dart';

class CartProvider extends ChangeNotifier {
  CartRepo _cartRepository;

  ControllerState _controllerState = ControllerState.init;
  var _cartItems = <CartModel>[];
  bool _isGuest = false;

  ControllerState get controllerState => _controllerState;

  List<CartModel> get cartItems => _cartItems;

  init() async {
    _updateControllerState(ControllerState.loading);
    _cartItems = await _getCartItems();
    _updateControllerState(ControllerState.loaded);
  }

  Future<List<CartModel>> _getCartItems() async {
    try {
      final localCartItems = await LocalDatabase.getCartItems();
      //if the user is guest then don't grant access to cart repo in the database
      //instead just use the local database to store cart items
      //else give the user access to the database
      //and get the cart items if there is any..
      if (await LocalDatabase.isLogedAsGuest()) {
        print('_isGuest');
        _isGuest = true;
        return localCartItems;
      } else {
        final user = await LocalDatabase.getUser();
        _cartRepository = CartRepo(user.uid);
        final remoteCartItems = await _cartRepository.getCartItems();
        //this condition will make sure to avoid adding the item twice
        // if it is present is in the local and remote data database
        if (localCartItems.isNotEmpty) {
          localCartItems.forEach((locItem) {
            if (!remoteCartItems
                .any((remItem) => remItem.product.id == locItem.product.id)) {
              remoteCartItems.add(locItem);
              //Also Add the local cart item to the remote Cart
              //in the database if it does not exist there
              _cartRepository.addToCart(cartItem: locItem);
            }
          });
          LocalDatabase.clearLocalCart();
        }
        return remoteCartItems;
      }
    } catch (e) {
      print(e);
      // rethrow;
    }
  }

  void disposer() {
    _cartItems = [];
    _cartRepository = null;
  }

  Future<void> addToCart({@required ProductModel product}) async {
    CartModel cartItem;
    try {
      //if the poduct is in the cart just increase the quantity by one.
      final isInCart = _cartItems.any((e) => e.product.id == product.id);
      if (isInCart) {
        cartItem = _cartItems.firstWhere((e) => e.product.id == product.id);
        increaseQTY(product.id);
      } else {
        cartItem =
            CartModel(cartItemId: Uuid().v4(), product: product, quantity: 1);
        _cartItems.add(cartItem);
        if (!_isGuest)
          _cartRepository.addToCart(cartItem: cartItem);
        else
          LocalDatabase.updateLocalCart(cartItems: _cartItems);
      }
    } catch (e) {
      showErrorMessage(
          'Unkown error, couldnt add ${cartItem.product.productName} to your cart');
      _cartItems.remove(cartItem);
    }
  }

  Future<void> increaseQTY(String productId) async {
    try {
      final index = _cartItems.indexWhere((e) => e.product.id == productId);
      _cartItems[index] =
          _cartItems[index].copyWith(quantity: _cartItems[index].quantity + 1);
      if (!_isGuest)
        _cartRepository.updateCartItem(cartItem: _cartItems[index]);
      else
        LocalDatabase.updateLocalCart(cartItems: _cartItems);
    } catch (e) {
      rethrow;
    }
  }

//to simulate fake checkout
  Future<void> clearCart() async {
    _updateControllerState(ControllerState.loading);
    try {
      await _cartRepository.clearCart();
      _cartItems.clear();
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      _updateControllerState(ControllerState.loaded);
      rethrow;
    }
  }

  Future<void> removeFromCart(String cartItemId) async {
    try {
      _cartItems.removeWhere((element) => element.cartItemId == cartItemId);
      notifyListeners();
      if (!_isGuest)
        _cartRepository.removeFromCart(cartItemId);
      else
        LocalDatabase.updateLocalCart(cartItems: _cartItems);
    } catch (e) {
      rethrow;
    }
  }

  void _updateControllerState(ControllerState state) {
    _controllerState = state;
    notifyListeners();
  }
}
