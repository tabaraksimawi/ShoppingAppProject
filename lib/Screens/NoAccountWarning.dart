import 'package:flutter/material.dart';

import '../Providers/providers.dart';
import './Core/core.dart';
import './auth/SignIn/SignInScreen.dart';

class NoAccountWarningPage extends StatelessWidget {
  static final String routeName = '/noAccount';
  const NoAccountWarningPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: NoAccountWarningWidget(
          description:
              'Please sign in so that you can have all the advantages of our Store!'),
    );
  }
}

class NoAccountWarningWidget extends StatelessWidget {
  final String headLine;
  final String description;
  const NoAccountWarningWidget({
    Key key,
    this.headLine,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Image.asset("assets/images/noacc.png"),
          ),
        ),
        Text(
          'You don\'t have an account',
          style: DefaultElements.headingStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description ??
                'Please sign in so that you can have all the advantages of our application!',
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(50),
          child: DefaultButton(
            text: "Sign In",
            onPressed: () {
              Navigator.of(context).pushNamed(SignInScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}

// This will redirect the user to the [NoAccountWarningPage] if
// he doesn't have an account, or it will perform
// the desired action if he does have an account
void displayNoAccountPageOr(
    {@required BuildContext context, @required VoidCallback orDoAction}) {
  final isGuest = Provider.of<UserProvider>(context, listen: false).isGuest;

  if (isGuest) {
    Navigator.of(context).pushNamed(NoAccountWarningPage.routeName);
  } else {
    orDoAction();
  }
}
