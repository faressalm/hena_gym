import 'package:hena_gym/data/models/order.dart';

import '../models/product.dart';
import '../services/market_services.dart';

class MarketServicesRepository {
  final MarketServices marketServices;

  MarketServicesRepository({required this.marketServices});
  Future<List<Product>?> getAllProducts() async {
    List<dynamic> marketQuery = await marketServices.getAllProducts();
    return marketQuery.map(_mapToProduct).toList();
  }
  Future<bool> addOrder(String address,String userPhone,String userName,int quantity,String uid)async {
    return marketServices.addOrder(Order(address: address, userName: userName, userPhone: userPhone, quantity: quantity,userId: uid));
  }

  Product _mapToProduct(data) {
    return Product(
        price: data["price"],
        description: data["Description"],
        quantity: data["quantity"],
        name: data["name"],
        imageURL: data["imageURL"],
        offer: data["offer"],
        offerTime: data["offerTime"],
        category: data["category"]
    );
  }
}