import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/Home/HomeScreen.dart';
import 'package:myshopping_app/Screens/Profile/ProfileScreen.dart';
import 'CompleteProfile/ProfileScreen.dart';
import 'ForgetPassword/ForgetPasScreen.dart';
import 'LogIn/LogInSuccessScreen.dart';
import 'SignIn/SignInScreen.dart';
import 'SignUp/SignUpScreen.dart';
import 'Splash/SplashScreen.dart';
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
};
