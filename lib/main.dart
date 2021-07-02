
import 'package:flutter/material.dart';
import 'package:myshopping_app/Models/ShoeListModel.dart';
import 'package:myshopping_app/Providers/CartItem.dart';
import 'package:provider/provider.dart';
import 'Routes.dart';
import 'Splash/SplashScreen.dart';

void main()async {
 // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //  return ChangeNotifierProvider<ProductProvider>(
      //create: (context)=>ProductProvider(),
      return MultiProvider
        (providers: [
      ChangeNotifierProvider.value(value: ShoeListModel(),
      )
        ],
         child :MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
      )
      );
  }
}
