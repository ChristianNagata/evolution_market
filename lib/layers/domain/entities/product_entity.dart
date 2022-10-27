class ProductEntity {
  String name;
  String description;
  String imagePath;
  String formattedPrice;
  int numberOfProducts;
  bool isOnSale;

  ProductEntity({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.formattedPrice,
    required this.numberOfProducts,
    required this.isOnSale,
  });
}
