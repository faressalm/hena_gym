import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hena_gym/constants/my_gui.dart';

// ignore: must_be_immutable
class SettingRow extends StatelessWidget {
  final String iconPath;
  final String screenName;
  final String rowTitle;
  dynamic arguments;
  SettingRow(
      {Key? key,
      required this.iconPath,
      required this.screenName,
      required this.rowTitle,
      this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screenName, arguments: arguments);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(20),
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
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Image.asset(iconPath),
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                rowTitle,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: MyColors.darkBlue, fontWeight: FontWeight.w600)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
