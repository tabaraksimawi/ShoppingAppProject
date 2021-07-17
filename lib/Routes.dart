import 'package:flutter/material.dart';

import './Screens/Favorite/FavoriteScreen.dart';
import './Screens/Home/HomeScreen.dart';
import './Screens/NoAccountWarning.dart';
import './Screens/Profile/ProfileScreen.dart';
import './Screens/Splash/SplashScreen.dart';
import './Screens/auth/ForgetPassword/ForgetPasScreen.dart';
import './Screens/auth/SignIn/SignInScreen.dart';
import './Screens/auth/SignUp/SignUpScreen.dart';
import './Screens/cart/AddressPage.dart';
import './Screens/cart/PaymentPage.dart';
import './Screens/cart/cart_screen.dart';
import './Screens/auth/CompleteProfile/ProfileScreen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  AddressPage.routeName: (context) => AddressPage(),
  PaymentPage.routeName: (context) => PaymentPage(),
  OrderCompletion.routeName: (_) => OrderCompletion(),
  SplashScreen.routeName: (_) => SplashScreen(),
  NoAccountWarningPage.routeName: (_) => NoAccountWarningPage(),
};
