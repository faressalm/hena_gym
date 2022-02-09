import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hena_gym/constants/my_gui.dart';

class Advice extends StatelessWidget {
  const Advice({
    Key? key,
    required this.advice,
  }) : super(key: key);

  final String advice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 15,
          backgroundColor: MyColors.white,
          child: Image.asset("assets/icons/advice.png"),
        ),
        title: Text(
          advice,
          style: GoogleFonts.poppins(),
        ));
  }
}
