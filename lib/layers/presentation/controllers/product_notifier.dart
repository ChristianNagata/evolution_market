import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

String _lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

String _image =
    'https://images.newscientist.com/wp-content/uploads/2021/07/19142457/20-july_tomato-nervous-system.jpg?width=800';

class ProductNotifier with ChangeNotifier {
  List<ProductEntity> _products = [
    ProductEntity(
      name: 'Product',
      description: _lorem,
      imagePath: _image,
      formattedPrice: '23,90',
      numberOfProducts: 0,
      isOnSale: true,
    ),
  ];

  final ProductRepository _productRepository;

  ProductNotifier(this._productRepository) {
    getProducts(1, 5);
  }

  List<ProductEntity> get products => _products;

  Future<void> getProducts(int page, int limit) async {
    _products = await _productRepository.getProducts(page, limit);
  }
}
