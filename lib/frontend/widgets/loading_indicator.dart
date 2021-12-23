import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/my_gui.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.darkRed,
      ),
    );
  }
}
