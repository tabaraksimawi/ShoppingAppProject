import 'package:flutter/cupertino.dart';

import './state.dart';
import '../data/Models/userModel.dart';
import '../data/localDatabase.dart';
import '../data/userRepo.dart';

enum AuthState {
  init,
  authenticated,
  notAuthenticated,
  guest,
}

class UserProvider extends ChangeNotifier {
  UserRepository _userRepository;

  UserModel _user = UserModel.init();
  AuthState _authState = AuthState.init;
  ControllerState _controllerState = ControllerState.init;
  bool _isGuest = false;

  AuthState get authState => _authState;
  ControllerState get controllerState => _controllerState;
  bool get isGuest => _isGuest;
  UserModel get user => _user;

  UserProvider() {
    this._init();
  }

  _init() async {
    _userRepository = UserRepository();

    if (await LocalDatabase.isLogedAsGuest()) {
      _isGuest = true;
      _updateAuthState(AuthState.guest);
    } else {
      final localUser = await LocalDatabase.getUser();
      if (localUser != null) {
        _user = localUser;
        LocalDatabase.logInAsGuest(removeGuestMode: true);

        _updateAuthState(AuthState.authenticated);
      } else {
        _updateAuthState(AuthState.notAuthenticated);
      }
    }
  }

  Future<void> signUp(String password, UserModel newUser) async {
    _updateControllerState(ControllerState.loading);
    try {
      _user = await _userRepository.signUp(password, newUser);
      LocalDatabase.logInAsGuest(removeGuestMode: true);
      _updateAuthState(AuthState.authenticated);
      _updateControllerState(ControllerState.loaded);
      _isGuest = false;
    } catch (e) {
      print('$e signUpc');
      _updateAuthState(AuthState.notAuthenticated);
      _updateControllerState(ControllerState.loaded);
      rethrow;
    }
  }

  Future<void> logInAsGuest() async {
    _updateControllerState(ControllerState.loading);
    _isGuest = true;
    await _userRepository.loginAsGuets();
    _updateAuthState(AuthState.guest);
    _updateControllerState(ControllerState.loaded);
  }

  Future<void> logIn(String password, String email) async {
    _updateControllerState(ControllerState.loading);

    try {
      _user = await _userRepository.login(email, password);
      LocalDatabase.logInAsGuest(removeGuestMode: true);
      _updateAuthState(AuthState.authenticated);
      _updateControllerState(ControllerState.loaded);
      _isGuest = false;
    } catch (e) {
      _updateAuthState(AuthState.notAuthenticated);
      _updateControllerState(ControllerState.loaded);
      rethrow;
    }
  }

  Future<void> signOut() async {
    _updateControllerState(ControllerState.loading);

    try {
      _updateAuthState(AuthState.notAuthenticated);
      await _userRepository.signOut();
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      _updateControllerState(ControllerState.loaded);
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      _updateControllerState(ControllerState.loading);
      await _userRepository.resetPassword(email);
      _updateControllerState(ControllerState.loaded);
    } catch (e) {
      _updateControllerState(ControllerState.loaded);

      rethrow;
    }
  }

  void _updateControllerState(ControllerState state) {
    _controllerState = state;
    notifyListeners();
  }

  void _updateAuthState(AuthState state) {
    _authState = state;
    notifyListeners();
  }
}
