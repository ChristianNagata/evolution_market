import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

enum ProductsState { initial, loading, loaded, error }

class ProductNotifier with ChangeNotifier {
  List<ProductEntity> _products = [];
  ProductsState _state = ProductsState.initial;

  final ProductRepository _productRepository;

  ProductNotifier(this._productRepository);

  ProductsState get state => _state;

  void setState(ProductsState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> init() async {
    await getProducts(1, 7);
  }

  bool get tokenExpired => _state == ProductsState.error;

  List<ProductEntity> get products => _products;

  Future<void> getProducts(int page, int limit) async {
    setState(ProductsState.loading);
    final productsEither = await _productRepository.getProducts(page, limit);

    productsEither.fold(
      (l) {
        setState(ProductsState.error);
      },
      (r) {
        setState(ProductsState.loaded);
        _products = r;
      },
    );

    notifyListeners();
  }
}
