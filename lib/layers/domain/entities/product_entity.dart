class ProductEntity {
  String name;
  String description;
  String imagePath;
  String price;
  int numberOfProducts;
  bool isOnSale;

  ProductEntity({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.numberOfProducts,
    required this.isOnSale,
  });

  String get formattedPrice => price.replaceFirst('.', ',');
}
