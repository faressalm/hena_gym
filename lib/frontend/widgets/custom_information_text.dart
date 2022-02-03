import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hena_gym/constants/my_gui.dart';

class CustomInformationText extends StatelessWidget {
  final String title;
  final String value;
  final Size size;
  const CustomInformationText(
      {Key? key, required this.title, required this.value, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - kDefaultPadding * 2,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(6),
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
      child: RichText(
        text: TextSpan(
          style: const TextStyle(),
          children: [
            TextSpan(
              text: title + "\n",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                  color: MyColors.cyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            TextSpan(
              text: value,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                  color: MyColors.darkBlue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
