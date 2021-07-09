import 'package:flutter/material.dart';

class DefaultInputFeild extends StatelessWidget {
  final String hintText;
  final String lableText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final Widget suffixIcon;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;

  const DefaultInputFeild({
    this.hintText,
    this.icon,
    this.lableText,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.minLines,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blueAccent, width: 2),
      //   borderRadius: BorderRadius.circular(29),
      // ),
      // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        maxLines: minLines ?? 1,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon, size: 20) : null,
          hintText: hintText,
          labelText: lableText,
          // border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
