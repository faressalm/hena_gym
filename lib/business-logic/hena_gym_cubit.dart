import 'package:bloc/bloc.dart';

import '../data/models/my_user.dart';
import '../data/services/auth_services.dart';
import 'auth/cubit/hena_gym_cubit.dart';

class HenaGymCubit extends Cubit<HenaGymState> {
  final AuthServices authServices;
  late MyUser myUser;
  HenaGymCubit({required this.authServices}) : super(HenaGymInitial());
}
