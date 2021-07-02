import 'package:flutter/cupertino.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';

class CartItem extends ChangeNotifier
{
  List <ShoeListModel> products =[];
  addProduct(ShoeListModel shoeListModel) //method
  {
        products.add(shoeListModel);
        notifyListeners();
  }
}