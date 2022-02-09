import 'package:flutter/cupertino.dart';
import '../constants/strings.dart';

popAllUntilfirstScreen(context) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    henaGymLayout,
    (route) => false,
  );
}
