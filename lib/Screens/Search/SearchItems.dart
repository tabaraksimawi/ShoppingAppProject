import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myshopping_app/Component/Constatns.dart';
class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 100,
              child: Center(
                child: Image.network(""),
              ),
            ),
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("",
                    style:GoogleFonts.montserrat(textStyle: TextStyle(color:Colors.black54,
                        fontSize:18,)
                    )

                    ),
                  ],
                ),
              ],
            ),

          ),
        ),
        Expanded(
          child: Container(
            height: 100,

          ),
        ),
      ],
    );
  }
}
