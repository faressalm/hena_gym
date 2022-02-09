import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/my_gui.dart';

class ImageWithSuptitle extends StatelessWidget {
  final String imagepath;
  final String subtitle;
  const ImageWithSuptitle(
      {Key? key,
      required this.size,
      required this.imagepath,
      required this.subtitle})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        width: size.width * 0.4,
        decoration: boxShadow.copyWith(
            color: MyColors.darkBlue, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
                height: size.height * 0.18,
                width: size.width * 0.4,
                child: Image.asset(
                  imagepath,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Text(subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: MyColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
