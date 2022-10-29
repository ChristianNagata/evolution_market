import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HomeNotifier with ChangeNotifier {
  late GlobalKey<ScaffoldState> _key;
  late ProductEntity _product;

  GlobalKey<ScaffoldState> get key => _key;

  HomeNotifier() {
    init();
  }

  ProductEntity get product => _product;

  Future<void> init() async {
    _key = GlobalKey();
  }

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
