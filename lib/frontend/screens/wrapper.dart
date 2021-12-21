import 'package:flutter/cupertino.dart';
import 'package:hena_gym/data/models/my_user.dart';
import 'package:provider/provider.dart';

import 'authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return user == null
        ? const SignIn()
        : Container(); // TODO:: Container-> home
  }
}
