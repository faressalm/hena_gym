class Order{
  final String address;
  final String userName;
  final String userPhone;
  final int quantity;
  final String userId;
  Order({
   required this.address,
   required this.userName,
   required this.userPhone,
    required this.quantity,
    required this.userId
});
  Map<String,dynamic> toMap(){
    return {
      'address':address,
      'username':userName,
      'phone':userPhone,
      'quantity':quantity,
      'userId':userId
    };
  }
}