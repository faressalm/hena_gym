class Product{
  final String description;
  final String price;
  final String name;
  final String offer;
  final String offerTime;
  final String category;
  final String imageURL;
  final  int quantity;
  Product({
    required this.description,
    required this.category,
    required this.imageURL,
    required this.name,
    required this.offer,
    required this.price,
    required this.quantity,
    required this.offerTime
});
}