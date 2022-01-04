import 'package:cloud_firestore/cloud_firestore.dart';

class GymServices {
  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference postsCollection;
  GymServices(this._firebaseFirestore) {
    postsCollection = _firebaseFirestore.collection("gyms");
  }
  Future<List<dynamic>> getAllGyms() async {
    QuerySnapshot gymsQuery = await postsCollection.get();
    return gymsQuery.docs.map((e) => e.data()).toList();
  }
}
