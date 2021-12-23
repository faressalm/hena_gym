import 'package:bloc/bloc.dart';
import '../../data/models/gym.dart';
import '../../data/repository/gym_repo.dart';
import 'package:meta/meta.dart';

part 'show_gym_state.dart';

class ShowGymCubit extends Cubit<ShowGymState> {
  final GymServicesRepository gymServicesRepository;
  List<Gym> gyms = [];
  ShowGymCubit({required this.gymServicesRepository}) : super(ShowGymInitial());

  List<Gym> getAllGyms() {
    gymServicesRepository.getAllGyms().then((gyms) {
      emit(GymsLoaded(gyms!));
      this.gyms = gyms;
    });
    return gyms;
  }
}
