import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hena_gym/constants/my_gui.dart';

class CustomInformationText extends StatelessWidget {
  final String title;
  final String value;
  const CustomInformationText(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
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
                color: MyColors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
