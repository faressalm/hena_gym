import 'package:bloc/bloc.dart';
import 'package:hena_gym/data/models/my_user.dart';
import 'package:hena_gym/data/services/auth_services.dart';
import 'package:meta/meta.dart';

part 'hena_gym_state.dart';

class HenaGymCubit extends Cubit<HenaGymState> {
  final AuthServices authServices;
  late MyUser myUser;
  HenaGymCubit({required this.authServices}) : super(HenaGymInitial());
}
