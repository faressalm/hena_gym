import 'package:flutter/cupertino.dart';
import '../../constants/my_gui.dart';

class HeadAndBaseLine extends StatelessWidget {
  final String headline;
  final String baseline;
  const HeadAndBaseLine({
    Key? key,
    required this.headline,
    required this.baseline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "$headline\n",
              style: const TextStyle(
                  color: MyColors.greyBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: "$baseline\n",
              style: const TextStyle(
                  color: MyColors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ])),
    );
  }
}
