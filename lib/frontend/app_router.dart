import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/data/models/gym.dart';
import 'package:hena_gym/data/models/user_calories.dart';
import 'package:hena_gym/data/repository/url_repo.dart';
import 'package:hena_gym/data/services/url_services.dart';
import 'package:hena_gym/frontend/screens/gym/gym_detailed_screen.dart';
import 'package:hena_gym/frontend/screens/nutrition/calculate_calories.dart';
import 'package:hena_gym/frontend/screens/nutrition/goal_screen.dart';
import 'package:hena_gym/frontend/screens/nutrition/measurements_screen.dart';
import 'screens/authenticate/forget_password.dart';
import 'screens/authenticate/sign_in.dart';
import 'screens/hena_gym_layout.dart';

import '../constants/strings.dart';
import 'screens/authenticate/register.dart';
import 'screens/nutrition/goal_type_sccreen.dart';
import 'screens/wrapper.dart';

class AppRouter {
  URLRepository urlRepository = URLRepository(urlServices: URLServices());

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
      case gymDetailedScreen:
        final gym = settings.arguments as Gym;
        return MaterialPageRoute(
            builder: (_) => GymDetailedScreen(
                  gym: gym,
                  urlRepository: urlRepository,
                ));
      case calculateCaloriesScreen:
        final BuildContext buildContext = settings.arguments as BuildContext;
        return MaterialPageRoute(
            builder: (_) =>
                CalculateCaloriesScreen(cubitContext: buildContext));
      case measurementsScreen:
        return MaterialPageRoute(builder: (_) => const MeasurementsScreen());
      case goalScreen:
        final userCalories = settings.arguments as UserCalories;
        return MaterialPageRoute(
            builder: (_) => GoalScreen(userCalories: userCalories));
      case goalTypeScreen:
        final map = settings.arguments as Map;
        final userInfo = map["userInfo"];
        final cubitContext = map["cubitContext"];
        return MaterialPageRoute(
            builder: (_) =>
                GoalTypeScreen(userInfo: userInfo, cubitContext: cubitContext));
    }
  }
}
