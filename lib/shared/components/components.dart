import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget actionButton({
  required Function function,
  Color backgroundColor = Colors.purple,
  AlignmentGeometry alignment = Alignment.center,
  double width = 200.0,
  required String text,
  bool isUpperCase = true,
  double radius = 20.0,
}) {
  return GestureDetector(
    onTap: () {
      return function();
    },
    child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        alignment: alignment,
        width: width,
        child: Text(isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ))),
  );
}

Widget Materialbutton({
  Color backgroundColor = Colors.red,
  double width = double.infinity,
  required Function function,
}) {
  return Container(
    height: 40.0,
    color: backgroundColor,
    width: width,
    child: MaterialButton(
      onPressed: () {
        return function();
      },
      child: Text(
        'enter',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget headBar({
  required String text,
}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.purple,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

foemfieldWidget({
  required TextEditingController InputData,
  required TextInputType textInputType,
  required int maxline,
  required Function validate,
  required IconData prefix,
  required String labeltext,
  bool isPassword = false,
  double borderradius = 10.0,
  IconData? suffix,
  Function? suffixPressed,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.always,
    controller: InputData,
    keyboardType: textInputType,
    maxLines: maxline,
    autofocus: true,
    obscureText: isPassword,
    validator: (value) {
      return validate(value);
    },
    decoration: InputDecoration(
      labelText: labeltext,
      border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(borderradius)),
      prefixIcon: Icon(prefix),
      suffixIcon: IconButton(
        onPressed: () {
          return suffixPressed!();
        },
        icon: Icon(suffix),
      ),
    ),
  );
}
