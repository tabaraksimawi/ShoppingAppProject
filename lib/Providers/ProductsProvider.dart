import 'package:flutter/foundation.dart';

import './state.dart';
import '../data/Models/ProductModel.dart';
import '../data/productRepo.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsRepo _productsRepo;

  var _products = <ProductModel>[];
  var _controllerState = ControllerState.init;
  String _initErrorMessage;
  int productsLimit = 20;
  bool _hasNext = true;

  ControllerState get controllerState => _controllerState;
  List<ProductModel> get products {
    _products
        .sort((a, b) => b.numberOfPurchases.compareTo(a.numberOfPurchases));
    return _products;
  }

  bool get hasNext => _hasNext;
  String get initError => _initErrorMessage;

  ProductsProvider() {
    this._init();
  }

  _init() async {
    print('init');
    _productsRepo = ProductsRepo();
    _updateControllerState(ControllerState.loading);
    try {
      _products = await _productsRepo.getProducts(productsLimit);
      _initErrorMessage = null;
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      _initErrorMessage = e;
      _updateControllerState(ControllerState.loaded);
    }
  }

  Future<void> getProducts() async {
    if (_controllerState == ControllerState.loading) return;
    _updateControllerState(ControllerState.loading);
    List<ProductModel> newProducts = [];
    try {
      newProducts = await _productsRepo.getProducts(
        productsLimit,
        lastItemId: _products.isNotEmpty ? _products.last.id : null,
      );

      _products.addAll(newProducts);
      if (newProducts.length < productsLimit) _hasNext = false;
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      _updateControllerState(ControllerState.loaded);
      // rethrow;
    }
  }

  Future<void> updateProduct(ProductModel productModel) async {
    _updateControllerState(ControllerState.loading);

    try {
      final index = _products.indexWhere((e) => e.id == productModel.id);
      _products[index] = _products[index].copyWith(
          quantity: productModel.quantity,
          numberOfPurchases: productModel.numberOfPurchases + 1);

      await _productsRepo.updateProductQuantity(productModel.id,
          productModel.quantity, productModel.numberOfPurchases);
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      print(e);
      _updateControllerState(ControllerState.loaded);
      rethrow;
    }
  }

  void _updateControllerState(ControllerState state) {
    _controllerState = state;
    notifyListeners();
  }
}
