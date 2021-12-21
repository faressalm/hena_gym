import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyColors {
  static const Color white = Color(0xFFF7F7F7);
  static const Color lightGray = Color(0xffB2B2B2);
  static const Color gray = Color(0xff6F6F6F);
  static const Color grayBlue = Color(0xff373B59);
  static const Color darkBlue = Color(0xff0C1248);
  static const Color red = Color(0xffd03737);
  static const Color darkRed = Color(0xff860C0C);
  static const Color cyan = Color(0xff74E0EF);
}

var textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: const EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: MyColors.darkRed, width: 2.0),
    borderRadius: BorderRadius.circular(20.0),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: MyColors.cyan, width: 2.0),
  ),
);