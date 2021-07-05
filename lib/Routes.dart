import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/Favorite/FavoriteScreen.dart';
import 'package:myshopping_app/Screens/Home/HomeScreen.dart';
import 'package:myshopping_app/Screens/Profile/ProfileScreen.dart';
import 'CompleteProfile/ProfileScreen.dart';
import 'ForgetPassword/ForgetPasScreen.dart';
import 'LogIn/LogInSuccessScreen.dart';
import 'SignIn/SignInScreen.dart';
import 'SignUp/SignUpScreen.dart';
import 'Splash/SplashScreen.dart';
import 'package:myshopping_app/Screens/cart/cart_screen.dart';
import 'package:myshopping_app/Screens/UserInfo.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  FavoriteScreen.routeName:(context)=> FavoriteScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  UserInfo.routeName: (context) => UserInfo(),
};
