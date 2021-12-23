import 'package:firebase_auth/firebase_auth.dart';
import '../../constants/enums.dart';
import '../models/my_user.dart';
import '../services/auth_services.dart';

class AuthRepository {
  final AuthServices authServices;
  AuthRepository(this.authServices);

  Stream<MyUser?> get user {
    return authServices.user.map(_userFromFirebaseUser);
  }

  Future<MyUser?> signInWithEmailAndPassword(email, password) async {
    User? user = await authServices.signInWithEmailAndPassword(email, password);
    return user != null ? _userFromFirebaseUser(user) : null;
  }

  Future<MyUser?> registerWithEmailAndPassword(String email,String userName, String password,
      String phone, String birthDate, String gender) async {
    User? user = await authServices.registerWithEmailAndPassword(
        email,userName, password, phone, birthDate, gender);
    return user != null ? _userFromFirebaseUser(user) : null;
  }

  Future<void> signOut() async {
    await authServices.signOut();
  }
  Future<void> sendResetEmail(String email)async{
    await authServices.sendResetEmail(email);
  }

  // create user obj based on firebase user
  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }
}
