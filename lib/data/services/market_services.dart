import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hena_gym/data/models/order.dart';

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
  Future<bool> addOrder(Order order)async{
    bool result =false;
   await FirebaseFirestore.instance
        .collection('orders')
        .add(order.toMap()).then((value) => result=true )
       .catchError((error)=>result=false);
   return result;
  }
}
