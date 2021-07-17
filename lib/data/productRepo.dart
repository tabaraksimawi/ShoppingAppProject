import 'package:cloud_firestore/cloud_firestore.dart';

import './Models/ProductModel.dart';
import './checkConnection.dart';
import './fakeData.dart';

class ProductsRepo {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('products');

  ///This func. is used to upload fake products to the database for testing
  static Future<void> uploadFakeProducts() async {
    final medsRef = FirebaseFirestore.instance.collection('products');
    final currentMeds = await medsRef.limit(1).get();
    if (currentMeds.docs.isEmpty) {
      for (final med in List.of(fakeProducts)) {
        await medsRef.add(med);
      }
    }
  }

  /// The function will return products from a database and you should provide
  /// the [take] and [lastItemId] parameters. The [take] is responsible
  /// for telling the database to only return products equal to what we specify.
  /// Because the database doesn't know where to begin, the [lastItemId] comes
  /// into play and it is optional since we don't want(or don't have)
  /// this id in the first query.
  Future<List<ProductModel>> getProducts(int take, {String lastItemId}) async {
    if (!await connected()) throw 'no internet Connection';

    QuerySnapshot medSnapshot;
    try {
      final medRef = _productCollection
          .orderBy('numberOfPurchases', descending: true)
          .limit(take);
      if (lastItemId == null) {
        medSnapshot = await medRef.get();
      } else {
        final doc = await _productCollection.doc(lastItemId).get();
        medSnapshot = await medRef.startAfterDocument(doc).get();
      }
      return _productsListFromSnapshot(medSnapshot);
    } catch (e) {
      print(e);
      throw 'Unknown error, please try agan later';
    }
  }

  List<ProductModel> _productsListFromSnapshot(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      return ProductModel.fromDocument(doc);
    }).toList();
  }

  static Future<ProductModel> getProductData(String productId) async {
    try {
      final productDoc = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();
      var med = ProductModel.fromDocument(productDoc);
      return med;
    } catch (e) {
      throw 'Unknown error, please try agan later';
    }
  }

  ///to update the quantity of the products after each purchase
  ///This functionality would be better placed on a server,
  ///but it is not within the scope of this project
  Future<void> updateProductQuantity(
      String prodId, int newQuantity, int noOfPurchases) async {
    if (!await connected()) throw 'no internet Connection';

    try {
      await _productCollection.doc(prodId).update({
        'quantity': newQuantity,
        "numberOfPurchases": noOfPurchases + 1,
      });
    } catch (e) {
      print(e);
      throw 'Unknown error, please try agan later';
    }
  }
}
