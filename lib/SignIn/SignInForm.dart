import 'package:flutter/material.dart';
import 'package:myshopping_app/Component/Constatns.dart';
import 'package:myshopping_app/Component/CustomSuffix.dart';
import 'package:myshopping_app/Component/DefaultButton.dart';
import 'package:myshopping_app/Component/FormError.dart';
import 'package:myshopping_app/Component/KeyboardHelper.dart';
import 'package:myshopping_app/ForgetPassword/ForgetPasScreen.dart';
import 'package:myshopping_app/LogIn/LogInSuccessScreen.dart';
import 'package:myshopping_app/Services/auth_service.dart';

import '../SizeConfig.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final _auth = AuthService();
  bool remember = false;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // Future <void> logIn() async{
  //AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //  FirebaseUser user = result.user;
  //  Navigator.pushNamed(context, LoginSuccessScreen.routeName);

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Log In ",
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                final userCredential = await _auth.signIn(email, password);
                print(userCredential.user.uid);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginSuccessScreen(),
                    ));
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                //try{
                //UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                // email: _email,
                //  password: _password);
                //  Navigator.pushNamed(context,LoginSuccessScreen.routeName);
                // }
                // catch(e){
                //   print("error");
                //  }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
