import 'package:flutter/material.dart';

import '../../Core/core.dart';
import '../../../Providers/providers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty &&
                  errors.contains(DefaultElements.kEmailNullError)) {
                setState(() {
                  errors.remove(DefaultElements.kEmailNullError);
                });
              } else if (DefaultElements.emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(DefaultElements.kInvalidEmailError)) {
                setState(() {
                  errors.remove(DefaultElements.kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty &&
                  !errors.contains(DefaultElements.kEmailNullError)) {
                setState(() {
                  errors.add(DefaultElements.kEmailNullError);
                });
              } else if (!DefaultElements.emailValidatorRegExp
                      .hasMatch(value) &&
                  !errors.contains(DefaultElements.kInvalidEmailError)) {
                setState(() {
                  errors.add(DefaultElements.kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                try {
                  await Provider.of<UserProvider>(context, listen: false)
                      .resetPassword(email);
                  showSuccessMessage(
                      "A reset password link has been sent to your email");
                } catch (e) {
                  showErrorMessage(e);
                }
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
