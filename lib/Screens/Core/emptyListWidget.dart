import 'package:flutter/material.dart';
import 'package:myshopping_app/Screens/Core/Component/DefaultElements.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.view_list_rounded,
            size: 100,
            color: DefaultElements.kPrimaryColor,
          ),
          Container(
            child: Text(
              'There is no items here',
              style: DefaultElements.headingStyle.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
