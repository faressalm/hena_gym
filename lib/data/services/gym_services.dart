import 'package:cloud_firestore/cloud_firestore.dart';

class GymServices {
  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference gymsCollection;
  GymServices(this._firebaseFirestore) {
    gymsCollection = _firebaseFirestore.collection("gyms");
  }
  Future<List<dynamic>> getAllGyms() async {
    QuerySnapshot gymsQuery = await gymsCollection.get();
    return gymsQuery.docs.map((e) => e.data()).toList();
  }
}
