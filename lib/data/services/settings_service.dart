import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/my_user.dart';
import '../../utils/constants.dart';

class SettingsService {
  Future<void> getUserData(context) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData!.uid)
        .get()
        .then((value) {
      userData = UserData.fromJson(value.data()!);
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<bool> updateUserData(String phone, String username, context) async {
    var result = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData!.uid)
        .update({"phone": phone, "username": username}).then((value) {
      result = true;
    }).catchError((error) {
      print(error.toString());
      result = false;
    });
    return result;
  }
}
