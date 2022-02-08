class Order{
  final String address;
  final String userName;
  final String userPhone;
  final int quantity;
  Order({
   required this.address,
   required this.userName,
   required this.userPhone,
    required this.quantity
});
  Map<String,dynamic> toMap(){
    return {
      'address':address,
      'username':userName,
      'phone':userPhone,
      'quantity':quantity
    };
  }
}