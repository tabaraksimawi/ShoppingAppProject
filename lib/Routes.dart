import 'package:flutter/material.dart';
import 'ForgetPassword/ForgetPasScreen.dart';
import 'LogIn/LogInSuccessScreen.dart';
import 'Screens/HomeScreenroute.dart';
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
};
