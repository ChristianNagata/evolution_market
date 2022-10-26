import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HomeNotifier with ChangeNotifier {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ProductEntity _product = ProductEntity();

  GlobalKey<ScaffoldState> get key => _key;

  ProductEntity get product => _product;

  void _updateDrawerData(product) {
    _product = product;
    notifyListeners();
  }

  void decrementCounter(ProductEntity product) {
    if (product.numberOfProducts > 0) {
      product.numberOfProducts--;
      notifyListeners();
    }
  }

  void incrementCounter(ProductEntity product) {
    if (product.numberOfProducts < 100) {
      product.numberOfProducts++;
      notifyListeners();
    }
  }

  void showProductDetails(ProductEntity product) {
    _updateDrawerData(product);
    _key.currentState!.openDrawer();
  }
}
