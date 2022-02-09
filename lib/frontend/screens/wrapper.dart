import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hena_gym/utils/constants.dart';
import 'hena_gym_layout.dart';
import '../../data/models/my_user.dart';
import 'package:provider/provider.dart';
import 'authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if(user !=null){
      FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value){
        userData= UserData.fromJson(value.data()!);
      }
      )
      .catchError((error){
        print(error.toString());
      });
    }
    return user == null ? SignIn() : const HenaGymLayout();
  }
}
