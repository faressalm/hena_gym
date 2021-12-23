import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_state.dart';
import '../../data/repository/auth_repo.dart';

class ForgetCubit extends Cubit<ForgetPasswordState> {
  final AuthRepository authRepository;
  ForgetCubit({required this.authRepository}) : super(ForgetPasswordInitial());
  static ForgetCubit get(context) => BlocProvider.of(context);
  void sendResetEmail({
    required String email,
  }) {
    emit(ForgetLoadingState());
    authRepository.sendResetEmail(email).then((value) {
      emit(ForgetSuccessState());
    }).catchError((onerror) {
      emit(ForgetErrorState());
    });
  }
}
