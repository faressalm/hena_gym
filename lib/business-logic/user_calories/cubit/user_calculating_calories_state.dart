part of 'user_calculating_calories_cubit.dart';

@immutable
abstract class UserCalculatingCaloriesState {}

class UserCalculatingCaloriesInitial extends UserCalculatingCaloriesState {}

class HasCaloriesSet extends UserCalculatingCaloriesState {
  final UserCalories userCalories;
  HasCaloriesSet(this.userCalories);
}

class CaloriesSetSucessfuly extends UserCalculatingCaloriesState {
  final UserCalories userCalories;
  CaloriesSetSucessfuly(this.userCalories);
}

class NoCaloriesSet extends UserCalculatingCaloriesState {}
