import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import './Models/userModel.dart';
import './checkConnection.dart';
import './localDatabase.dart';

class UserRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<UserModel> login(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var firebaseuser = result.user;

      final user = await FirestoreUserDatabase().getUserData(firebaseuser.uid);
      LocalDatabase.setUser(user: user);
      return user;
    } catch (e) {
      print('$e login');
      throw authErrorHandler(e);
    }
  }

  Future<void> loginAsGuets() async {
    try {
      await LocalDatabase.logInAsGuest();
    } catch (e) {
      print('$e loginAsGuets');
      print(e);
    }
  }

  Future<UserModel> signUp(String password, UserModel user) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: password);
      final firebaseUser = result.user;
      user = user.copyWith(uid: firebaseUser.uid);
      FirestoreUserDatabase().updateOrSetUserData(user: user);
      return user;
    } catch (e) {
      print('$e signUp');
      throw authErrorHandler(e);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('$e resetPassword');
      throw authErrorHandler(e);
    }
  }

  Future<void> signOut() async {
    try {
      await LocalDatabase.deleteUser();
      await _firebaseAuth.signOut();
    } catch (e) {
      print('$e signOut');
      throw authErrorHandler(e);
    }
  }
}

class FirestoreUserDatabase {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  ///get any user data by giving his Id
  Future<UserModel> getUserData(String uid) async {
    try {
      if (!await connected()) return null;
      final userDoc = await _usersCollection.doc(uid).get();
      final user = UserModel.fromDocument(userDoc);

      return user;
    } catch (e) {
      print('$e getUserData');
      rethrow;
    }
  }

  ///this func. can be used to add new user or update an existing one
  Future<UserModel> updateOrSetUserData({@required UserModel user}) async {
    try {
      await _usersCollection.doc(user.uid).set(user.toMap());
      LocalDatabase.setUser(user: user);
      LocalDatabase.logInAsGuest(removeGuestMode: true);
      return user;
    } catch (e) {
      print('$e updateOrSetUserData');
      rethrow;
    }
  }
}

String authErrorHandler(dynamic e) {
  print(e.code);
  if (e is PlatformException) {
    if (e.code == 'sign_in_failed') {
      return 'Unknown error, please try again later';
    } else if (e.code == 'network_error' ||
        e.code == 'ERROR_NETWORK_REQUEST_FAILED') {
      return 'No internet connection!';
    } else if (e.code == 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL') {
      return 'Email already in use by another account';
    } else if (e.code == 'ERROR_INVALID_EMAIL') {
      return 'Invalid email!';
    } else if (e.code == 'ERROR_WEAK_PASSWORD') {
      return 'Your password is too weak';
    } else if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
      return 'Email already in use';
    } else {
      return 'Unknown error, please try again later';
    }
  }
  if (e is FirebaseAuthException) {
    if (e.code == "auth/invalid-email") {
      return 'Invalid email!';
    } else if (e.code == 'user-not-found') {
      return 'There is no account with this email';
    } else if (e.code == 'email-already-in-use') {
      return 'Email already in use';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password';
    } else {
      return 'Unknown error, please try again later';
    }
  } else {
    if (e.code == 'ERROR_USER_NOT_FOUND') {
      return 'There is no account with this email';
    } else if (e.code == 'ERROR_WRONG_PASSWORD') {
      return 'Wrong password!';
    } else {
      return 'Unknown error, please try again later';
    }
  }
}
