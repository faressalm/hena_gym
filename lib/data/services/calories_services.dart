import 'package:cloud_firestore/cloud_firestore.dart';

class CaloriesServices {
  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference usersCaloriesCollection;
  final String uid;
  CaloriesServices(this._firebaseFirestore, this.uid) {
    usersCaloriesCollection = _firebaseFirestore.collection("users-calories");
  }
  Future<DocumentSnapshot?> getUserCalories() async {
    DocumentSnapshot? userCalories;
    await usersCaloriesCollection
        .doc(uid)
        .get()
        .then((value) =>
            {value.exists ? userCalories = value : userCalories = null})
        .catchError((onerror) {
      print(onerror);
      userCalories = null;
    });
    return userCalories;
  }

  Future<void> updateUserCalories(int calories) async {
    await usersCaloriesCollection.doc(uid).set({"calories": calories});
  }
}
