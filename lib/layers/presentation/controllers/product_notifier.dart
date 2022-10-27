import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductNotifier with ChangeNotifier {
  List<ProductEntity> _products = [];

  final ProductRepository _productRepository;

  ProductNotifier(this._productRepository) {
    getProducts(1, 5);
  }

  List<ProductEntity> get products => _products;

  Future<void> getProducts(int page, int limit) async {
    _products = await _productRepository.getProducts(page, limit);
  }
}
