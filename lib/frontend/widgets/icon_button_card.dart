import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/my_gui.dart';

class IconButtonCard extends StatelessWidget {
  const IconButtonCard({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      height: 62,
      width: 62,
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
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: MyColors.kBackgroundColor,
          ),
        ],
      ),
      child: child,
    );
  }
}
