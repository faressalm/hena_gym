part of 'show_gym_cubit.dart';

@immutable
abstract class ShowGymState {}

class ShowGymInitial extends ShowGymState {}

class GymsLoaded extends ShowGymState {
  final List<Gym> allGyms;
  GymsLoaded(this.allGyms);
}
