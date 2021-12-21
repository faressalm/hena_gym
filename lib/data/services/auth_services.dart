import 'package:firebase_auth/firebase_auth.dart';
import '../../constants/enums.dart';
import '../../utils/logger.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (error) {
      ApplicationLogger.getLogger("<signInWithEmailAndPassword>")
          .v(error.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password,
      String phone, DateTime birthDate, Gender gender) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (error) {
      ApplicationLogger.getLogger("<registerWithEmailAndPassword>")
          .v(error.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      ApplicationLogger.getLogger("<signOut>").v(e.toString());
    }
  }
}
