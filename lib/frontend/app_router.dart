import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    }
  }
}
