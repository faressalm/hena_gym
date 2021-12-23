import 'package:flutter/material.dart';
import 'screens/authenticate/forget_password.dart';
import 'screens/authenticate/sign_in.dart';
import 'screens/hena_gym_layout.dart';

import '../constants/strings.dart';
import 'screens/authenticate/register.dart';
import 'screens/wrapper.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case wrapper:
        return MaterialPageRoute(builder: (_) => const Wrapper());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => SignIn());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case henaGymLayout:
        return MaterialPageRoute(builder: (_) => const HenaGymLayout());
    }
  }
}
