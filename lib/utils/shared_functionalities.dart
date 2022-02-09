import 'package:flutter/cupertino.dart';
import 'package:hena_gym/constants/strings.dart';

popAllUntilfirstScreen(context) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    henaGymLayout,
    (route) => false,
  );
}
