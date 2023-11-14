import 'package:flutter/material.dart';

class Utils {
  static const backgroundColor = Color(0xff23282C);
  static TextStyle mediumTextStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.8));

  static const List<BoxShadow> myBoxShadow = [
    BoxShadow(
        blurRadius: 3,
        spreadRadius: 1,
        offset: Offset(-1, -1),
        color: Colors.grey),
    BoxShadow(
        blurRadius: 3,
        spreadRadius: 3,
        offset: Offset(1, 1),
        color: Color(0xff14141d))
  ];
}
