import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/my_user.dart';
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

  Future registerWithEmailAndPassword(String email, String userName,
      String password, String phone, String birthDate, String gender) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        UserData newUser = UserData(
            uid: result.user!.uid,
            phoneNumber: phone,
            userName: userName,
            birthDate: birthDate,
            gender: gender,
            email: email);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set(newUser.toMap());
      }

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
