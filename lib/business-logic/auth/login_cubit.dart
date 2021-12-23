import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth_repo.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit({required this.authRepository}) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void signIn({required String email, required String password}) {
    emit(LoginLoadingState());
    authRepository.signInWithEmailAndPassword(email, password).then((value) {
      if (value == null) {
        emit(LoginErrorState());
      } else {
        emit(LoginSuccessState());
      }
    });
  }
}
