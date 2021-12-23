import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/logger.dart';
import '../models/my_user.dart';

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
      ApplicationLogger.getLogger("<signInWithEmailAndPassword>")
          .v("sign in successfuly");
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
      ApplicationLogger.getLogger("<registerWithEmailAndPassword>")
          .v("register successfuly");
      return result.user;
    } catch (error) {
      ApplicationLogger.getLogger("<registerWithEmailAndPassword>")
          .v(error.toString());
      return null;
    }
  }

  Future sendResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      ApplicationLogger.getLogger("<signOut>").v("signOut successfuly");
    } catch (e) {
      ApplicationLogger.getLogger("<signOut>").v(e.toString());
    }
  }
}
