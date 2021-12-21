import 'package:bloc/bloc.dart';
import '../../data/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;
  RegisterCubit({required this.authRepository}) : super(RegisterInitial());
}
