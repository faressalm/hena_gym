part of 'hena_gym_cubit.dart';

@immutable
abstract class HenaGymState {}

class HenaGymInitial extends HenaGymState {}

class HenaGymUserLoaded extends HenaGymState {
  final MyUser myUser;
  HenaGymUserLoaded(this.myUser);
}

class HenaGymUserNotLoaded extends HenaGymState {}
