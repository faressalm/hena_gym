import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/enums.dart';
import '../../data/models/my_user.dart';
import '../../data/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit({required this.authRepository}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  userRegistering({
    required String email,
    required String userName,
    required String phone,
    required String password,
    required String birthDate,
    required String gender,
  }) {
    emit(RegisterLoadingState());
    authRepository
        .registerWithEmailAndPassword(
            email, userName, password, phone, birthDate, gender)
        .then((value) {
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }
}
