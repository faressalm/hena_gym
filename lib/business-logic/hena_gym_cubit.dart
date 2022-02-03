import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/frontend/screens/market/market_screen.dart';
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
  List<Widget> screens = [];
  List<String> titles = [];
  int currentIndex = 0;

  HenaGymCubit() : super(HenaGymInitial()) {
    screens = [
      BlocProvider(
        create: (context) => ShowGymCubit(
            gymServicesRepository: GymServicesRepository(
                gymServices: GymServices(_firebaseFirestore))),
        child: const ShowGym(),
      ),
      MarketScreen(),
      Container(),
      Container()
    ];
    titles = ['Find Your Gym', 'Market', 'Set Your Goal', ""];
  }

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HenaGymChangeBottomNavState());
  }
}
