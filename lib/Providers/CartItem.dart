import 'package:flutter/cupertino.dart';
import 'package:myshopping_app/Models/ProductModel.dart';

class CartItem extends ChangeNotifier {
  List<ProductModel> products = [];
  addProduct(ProductModel shoeListModel) //method
  {
    products.add(shoeListModel);
    notifyListeners();
  }
}
