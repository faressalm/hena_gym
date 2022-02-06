import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/noInternet.gif",
            width: size.height * 0.4,
            height: size.width * 0.4,
          ),
          Text("Please Check Your Internet Connection",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: MyColors.darkRed)),
        ],
      ),
    );
  }
}
