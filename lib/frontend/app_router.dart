import 'package:flutter/material.dart';
import 'package:hena_gym/frontend/screens/wrapper.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Wrapper());
      default:
    }
  }
}
