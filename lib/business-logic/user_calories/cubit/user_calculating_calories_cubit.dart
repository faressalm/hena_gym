import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_calories.dart';
import '../../../data/repository/calories_repo.dart';
import '../calories_calculation.dart';

part 'user_calculating_calories_state.dart';

class UserCalculatingCaloriesCubit extends Cubit<UserCalculatingCaloriesState> {
  final CaloriesServicesRepository caloriesServicesRepository;
  static UserCalculatingCaloriesCubit get(context) => BlocProvider.of(context);
  UserCalculatingCaloriesCubit({required this.caloriesServicesRepository})
      : super(UserCalculatingCaloriesInitial());
  late UserCalories? currentUserCalories;

  UserCalories? getUserCalories() {
    caloriesServicesRepository.getUserCalories().then((userCalories) {
      if (userCalories == null) {
        emit(NoCaloriesSet());
      } else {
        emit(HasCaloriesSet(userCalories));
      }
      currentUserCalories = userCalories;
      return currentUserCalories;
    });
  }

  UserCalories? updateUserCalories(Map userInfo, String goalType) {
    int? calories = CaloriesCalcuation()
        .getTotalCalories(userInfo, goalType, userData!.gender);
    caloriesServicesRepository
        .updateUserCalories(calories!)
        .then((userCalories) {
      currentUserCalories = UserCalories(calories: calories);
      emit(CaloriesSetSucessfuly(currentUserCalories!));
      return currentUserCalories;
    });
  }
}
