import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

const String _loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
    'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

class HomeNotifier with ChangeNotifier {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late ProductEntity _product;

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
