import '../models/product.dart';
import '../services/market_services.dart';

class MarketServicesRepository {
  final MarketServices marketSevices;

  MarketServicesRepository({required this.marketSevices});
  Future<List<Product>?> getAllProducts() async {
    List<dynamic> gymsQuery = await marketSevices.getAllProducts();
    return gymsQuery.map(_mapToProduct).toList();
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