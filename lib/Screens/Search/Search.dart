import 'package:flutter/material.dart';

import '../Core/Component/DefaultElements.dart';
import 'SearchItems.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultElements.kdefaultbgcolor,
      appBar: AppBar(
        title: Text(
          "Search",
          style: DefaultElements.headingStyle,
        ),
      ),
      body: ListView(
        children: [
          Text(
            "Items",
            style:
                TextStyle(height: 2, fontSize: 25, fontWeight: FontWeight.bold),
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
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ))),
          SizedBox(height: 10),
          SearchItem()
        ],
      ),
    );
  }
}
