import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:myshopping_app/Screens/HomePage.dart';
import 'package:myshopping_app/Screens/AccountPage.dart';
import 'package:myshopping_app/Screens/CartPage.dart';
import 'package:myshopping_app/Screens/MorePage.dart';
import 'package:myshopping_app/Component/Constatns.dart';
class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  // appbar
  AppBar appbar = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultElements.kdefaultbgcolor,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        CartPage(),
        MorePage(),
        AccountPage(),
      ],
    );
  }

  Widget getAppBar() {
    switch (activeTab) {
      case 0:
        appbar = null;
        break;
      case 1:
        appbar = null;
        break;
      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: DefaultElements.kdefaultbgcolor,
        );
        break;
      case 3:
        return AppBar(
          elevation: 0.8,
          backgroundColor: DefaultElements.kdefaultbgcolor,
        );
        break;
      case 4:
        return AppBar(
          elevation: 0.8,
          backgroundColor: DefaultElements.kdefaultbgcolor,
        );
        break;
      default:
    }
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: DefaultElements.kdefaultbgcolor,
          border: Border(top: BorderSide(color: DefaultElements.kshoebgcolorblue.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(itemsTab.length, (index) {
              return IconButton(
                  icon: Icon(
                    itemsTab[index]['icon'],
                    size: itemsTab[index]['size'],
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  });
            })),
      ),
    );
  }
}
