import 'package:flutter/material.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/data/models/user_calories.dart';

class CaloriesCalcuation {
  Map getProteinFatsCarbCalories(int calories) {
    return {
      "protein": (calories * 0.2 / 4).round(),
      "carb": (calories * 0.5 / 4).round(),
      "fats": (calories * 0.3 / 9).round(),
    };
  }

  int? getTotalCalories(Map userInfo, String goalType, String gender) {
    double BMR =
        getBMR(userInfo["weight"], userInfo["age"], userInfo["height"], gender);

    int calories = (BMR * userInfo["factor"]).round();
    switch (goalType) {
      case lossWeight:
        calories -= 500;
        break;
      case gainWeight:
        calories += 500;
        break;
      default:
        break;
    }
    return calories;
  }

  double getBMR(weight, age, height, gender) {
    if (gender == "Male") {
      return 88.362 + (weight * 13.397) + (height * 4.799) + (age * 5.677);
    } else {
      return 447.593 + (weight * 9.247) + (height * 3.098) + (age * 4.330);
    }
  }
}
