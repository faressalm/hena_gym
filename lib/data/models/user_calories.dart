class UserCalories {
  final int calories;
  UserCalories({required this.calories});
  // UserCalories.toJ
  Map<String, dynamic> toMap() {
    return {
      'calories': calories,
    };
  }
}
