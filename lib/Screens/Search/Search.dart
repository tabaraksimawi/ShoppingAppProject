import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/Search/SearchItems.dart';
import 'SearchItems.dart';
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 7, 60,147,1.0),
        title: Text("Search"),
      ),
      body: ListView(
          children: [
      ListTile(
      title: Text("Items",
          style: TextStyle(height: 2, fontSize: 25,fontWeight: FontWeight.bold),
      ),
    ),
            Container(
              height: 52,
              margin: EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide.none,
    ),
    fillColor:Color(0xffc2c2c2),
    filled: true,
    hintText: "Search for items in the store",
    suffixIcon: Icon(Icons.search),
            )
    )
    ),
    SizedBox(
    height: 10,
    ),
    SearchItem()
      ],
      ),
    );
  }
}
