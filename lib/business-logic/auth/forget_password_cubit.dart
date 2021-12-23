
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/auth/forget_password_state.dart';
import 'package:hena_gym/data/models/my_user.dart';
import 'package:hena_gym/data/repository/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';



class ForgetCubit extends Cubit<ForgetPasswordState> {
  final AuthRepository authRepository;
  ForgetCubit({required this.authRepository}) : super(ForgetPasswordInitial());
  static ForgetCubit get(context) => BlocProvider.of(context);
  void sendResetEmail({required String email,
  }){
    emit(ForgetLoadingState());
    authRepository.sendResetEmail(email).then((value){
      emit(ForgetSuccessState());
    }).catchError((onerror){
      emit(ForgetErrorState());
    });

  }
}