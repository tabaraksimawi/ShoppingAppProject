import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import './state.dart';
import '../data/Models/FavoriteModel.dart';
import '../data/Models/ProductModel.dart';
import '../data/localDatabase.dart';
import '../data/favoriteRepo.dart';
import '../Screens/Core/Component/overlayMessage.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteRepo _favRepository;

  ControllerState _controllerState = ControllerState.init;
  var _favorites = <Favorite>[];

  ControllerState get controllerState => _controllerState;

  List<Favorite> get favorites => _favorites;

  init() async {
    _updateControllerState(ControllerState.loading);
    try {
      //if the user is guest then don't grant access to user favorites in the database
      //beause there is no user in the first place
      if (!await LocalDatabase.isLogedAsGuest()) {
        final user = await LocalDatabase.getUser();
        _favRepository = FavoriteRepo(user.uid);
        _favorites = await _favRepository.getUserFavorites();
      } else {}
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      print(e);
      _updateControllerState(ControllerState.loaded);
    }
  }

  void disposer() {
    _favorites = [];
    _favRepository = null;
  }

  ///if the poduct is in the favorite list then delete it, otherwise just add it to favorites.
  Future<void> addOrRemovefromFavorite({@required ProductModel product}) async {
    Favorite favoriteItem;
    try {
      final isFavorite = this.isFavorite(product.id);
      if (isFavorite) {
        removeFromFavorite(product: product);
      } else {
        favoriteItem = Favorite(id: Uuid().v4(), product: product);
        _favorites.add(favoriteItem);
        showSuccessMessage('The product has been added to your favorites');
        notifyListeners();
        await _favRepository.addToFavorite(favorite: favoriteItem);
      }
    } catch (e) {
      showErrorMessage(
          'Unkown error, couldnt add the product to your favourite');
      _favorites.remove(favoriteItem);
    }
  }

  Future<void> removeFromFavorite({@required ProductModel product}) async {
    Favorite favoriteItem;
    try {
      favoriteItem = _favorites.firstWhere((e) => e.product.id == product.id);
      _favorites.remove(favoriteItem);
      notifyListeners();

      showSuccessMessage('The product has been removed from your favorites');
      await _favRepository.removeFromFavorites(favoriteItem.id);
    } catch (e) {
      showErrorMessage(
          'Unkown error, couldnt remove the product to your favourite');
      _favorites.remove(favoriteItem);
    }
  }

  bool isFavorite(String productId) {
    final isFav = _favorites.any((e) => e.product.id == productId);
    return isFav;
  }

  void _updateControllerState(ControllerState state) {
    _controllerState = state;
    notifyListeners();
  }
}
