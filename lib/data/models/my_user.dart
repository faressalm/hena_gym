import '../../constants/enums.dart';

class MyUser {
  final String uid;
  MyUser({required this.uid});
}

class UserData {
   late String uid;
   late String phoneNumber;
   late String userName;
   late String email;
   late String birthDate;
   late String gender;
  UserData(
      {required this.uid,
      required this.phoneNumber,
      required this.userName,
      required this.birthDate,
      required this.gender,
      required this.email});

  Map<String,dynamic> toMap(){
    return {
      'email':email,
      'username':userName,
      'phone':phoneNumber,
      'uId':uid,
      'birthdate':birthDate,
      'gender':gender
    };
  }
  UserData.fromJson(Map<String,dynamic>json)
  {
    userName = json['username'];
    email =json['email'];
    phoneNumber = json['phone'];
    uid = json['uId'];
    gender= json['gender'];
    birthDate=json['birthdate'];
  }

}
