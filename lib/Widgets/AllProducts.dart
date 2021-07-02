import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/ShoesCards.dart';
import 'package:provider/provider.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';
class AllProducts extends StatelessWidget {
  get index => null;

  get items => null;

  @override
  Widget build(BuildContext context) {
    final producstData= Provider.of<ShoeListModel>(context);
    final pdts = producstData.items;
    return GridView.builder(
      physics: ScrollPhysics(),
      itemCount: pdts.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: pdts[i],
       child:ShoesCards(
       shoeListModel: items[index],
      index: index,
       ),
      ),
    );
  }
}
