import 'package:flutter/cupertino.dart';
import '../../data/models/my_user.dart';
import 'package:provider/provider.dart';

import 'authenticate/register.dart';
import 'authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return user == null
        ? RegisterScreen()
        : Container(); // TODO:: Container-> home
  }
}
