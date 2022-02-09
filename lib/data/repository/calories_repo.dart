import 'package:hena_gym/data/models/user_calories.dart';
import 'package:hena_gym/data/services/calories_services.dart';

class CaloriesServicesRepository {
  final CaloriesServices caloriesServices;

  CaloriesServicesRepository({required this.caloriesServices});
  Future<UserCalories?> getUserCalories() async {
    dynamic gymsQuery = await caloriesServices.getUserCalories();

    if (gymsQuery == null) return null;
    return _mapToUserCalories(gymsQuery);
  }

  UserCalories _mapToUserCalories(data) {
    return UserCalories(calories: data["calories"]);
  }

  Future<void> updateUserCalories(int calories) async {
    await caloriesServices.updateUserCalories(calories);
  }
}
