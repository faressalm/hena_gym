import 'package:cloud_firestore/cloud_firestore.dart';

class MarketServices {
  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference postsCollection;
  MarketServices(this._firebaseFirestore) {
    postsCollection = _firebaseFirestore.collection("products");
  }
  Future<List<dynamic>> getAllProducts() async {
    QuerySnapshot marketQuery = await postsCollection.get();
    return marketQuery.docs.map((e) => e.data()).toList();
  }
}
