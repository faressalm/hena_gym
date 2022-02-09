import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_calories/cubit/user_calculating_calories_cubit.dart';
import '../data/repository/calories_repo.dart';
import '../data/services/calories_services.dart';
import '../frontend/screens/market/market_screen.dart';
import '../frontend/screens/nutrition/calculate_calories.dart';
import '../frontend/screens/nutrition/nutrition_setting.dart';
import '../frontend/screens/settings/settings_screen.dart';
import 'gym/show_gym_cubit.dart';
import '../data/repository/gym_repo.dart';
import '../data/services/gym_services.dart';
import '../frontend/screens/gym/show_gyms.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'hena_gym_state.dart';

class HenaGymCubit extends Cubit<HenaGymState> {
  static HenaGymCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String uid;
  List<Widget> screens = [];
  int currentIndex = 0;

  HenaGymCubit({required this.uid}) : super(HenaGymInitial()) {
    screens = [
      BlocProvider(
        create: (context) => ShowGymCubit(
            gymServicesRepository: GymServicesRepository(
                gymServices: GymServices(_firebaseFirestore))),
        child: const ShowGym(),
      ),
      MarketScreen(),
      BlocProvider(
        create: (context) => UserCalculatingCaloriesCubit(
            caloriesServicesRepository: CaloriesServicesRepository(
                caloriesServices: CaloriesServices(_firebaseFirestore, uid))),
        child: NutritionSetting(),
      ),
      SettingsScreen()
    ];
  }

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HenaGymChangeBottomNavState());
  }
}
