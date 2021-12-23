import 'package:cloud_firestore/cloud_firestore.dart';

class GymSevices {
  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference postsCollection;
  GymSevices(this._firebaseFirestore) {
    postsCollection = _firebaseFirestore.collection("gyms");
  }
  Future<List<dynamic>> getAllGyms() async {
    QuerySnapshot gymsQuery = await postsCollection.get();
    return gymsQuery.docs.map((e) => e.data()).toList();
  }
}
