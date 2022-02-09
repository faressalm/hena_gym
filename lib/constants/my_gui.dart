import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyColors {
  static const Color white = Color(0xFFF7F7F7);
  static const Color lightWhite = Color(0x99F7F7F7);
  static const Color lightGray = Color(0xffB2B2B2);
  static const Color grey = Color(0xff6F6F6F); // grey-> gray
  static const Color greyBlue = Color(0xff373B59);
  static const Color darkBlue = Color(0xff0C1248);
  static const Color red = Color(0xffd03737);
  static const Color darkRed = Color(0xff860C0C);
  static const Color cyan = Color(0xff74E0EF);
  static const kPrimaryColor = Color(0xFF0C9869);
  static const kTextColor = Color(0xFF3C4046);
  static const kBackgroundColor = Color(0x25373B59);
}

var textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: const EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: MyColors.darkRed, width: 2.0),
    borderRadius: BorderRadius.circular(20.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: MyColors.cyan, width: 2.0),
    borderRadius: BorderRadius.circular(20.0),
  ),
);
var boxShadow = BoxDecoration(
  boxShadow: [
    BoxShadow(
      offset: const Offset(0, 15),
      blurRadius: 22,
      color: MyColors.cyan.withOpacity(0.15),
    ),
    const BoxShadow(
      blurRadius: 20,
      color: MyColors.kBackgroundColor,
    ),
  ],
);

const double kDefaultPadding = 20.0;
