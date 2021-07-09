import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';

class UserInfo extends StatelessWidget {
  static String routeName = "/User_Info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: DefaultElements.kprimarycolor),
        elevation: 0.2,
        backgroundColor: DefaultElements.kdefaultbgcolor,
      ),
    );

    //FutureBuilder(
    // future: Provider.of(context).auth.getCurrentID(),
    // builder: (context,snapshot){
    //  if(snapshot.connectionState==ConnectionState.done){
    //    return Text("${snapshot.data}");
    //  }
    //  else{
    //    return CircularProgressIndicator();
    //  }
    //}
  }
}
