import 'package:evolution_market/layers/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.name,
    required super.description,
    required super.imagePath,
    required super.formattedPrice,
    required super.numberOfProducts,
    required super.isOnSale,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['nome'] as String,
      description: map['descricao'] as String,
      imagePath: map['foto'] as String,
      formattedPrice: map['preco'] as String,
      numberOfProducts: 0,
      isOnSale: map['promocao'] as bool,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      imagePath: imagePath,
      formattedPrice: formattedPrice,
      numberOfProducts: numberOfProducts,
      isOnSale: isOnSale,
    );
  }
}
