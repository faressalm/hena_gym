import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/user_calories/calories_calculation.dart';
import 'package:hena_gym/data/models/user_calories.dart';
import 'package:hena_gym/data/repository/calories_repo.dart';
import 'package:meta/meta.dart';

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
    int? calories =
        CaloriesCalcuation().getTotalCalories(userInfo, goalType, "Male");
    caloriesServicesRepository
        .updateUserCalories(calories!)
        .then((userCalories) {
      currentUserCalories = UserCalories(calories: calories);
      emit(CaloriesSetSucessfuly(currentUserCalories!));
      return currentUserCalories;
    });
  }
}
