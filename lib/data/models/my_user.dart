import '../../constants/enums.dart';

class MyUser {
  final String uid;
  MyUser({required this.uid});
}

class UserData {
  final String uid;
  final String phoneNumber;
  final String userName;
  final DateTime birthDate;
  final Gender gender;
  UserData(
      {required this.uid,
      required this.phoneNumber,
      required this.userName,
      required this.birthDate,
      required this.gender});
}
