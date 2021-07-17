import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './Routes.dart';
import './data/productRepo.dart';
import './Providers/providers.dart';
import './Screens/Splash/SplashScreen.dart';
import 'Screens/Core/Component/DefaultElements.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ProductsRepo.uploadFakeProducts();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: ProductsProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: FavoriteProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      theme: ThemeData(
          scaffoldBackgroundColor: DefaultElements.kdefaultbgcolor,
          appBarTheme: AppBarTheme(
            backgroundColor: DefaultElements.kdefaultbgcolor,
            centerTitle: true,
            foregroundColor: DefaultElements.kPrimaryColor,
            titleTextStyle: TextStyle(color: DefaultElements.kPrimaryColor),
            // actionsIconTheme: IconThemeData(),
            iconTheme: IconThemeData(
              color: DefaultElements.kPrimaryColor,
              size: 30,
            ),

            elevation: 0,
          )),
      title: 'Flutter Demo',
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
