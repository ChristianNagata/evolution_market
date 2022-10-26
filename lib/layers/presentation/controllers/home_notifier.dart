import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HomeNotifier with ChangeNotifier {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ProductEntity _product = ProductEntity();

  GlobalKey<ScaffoldState> get key => _key;

  ProductEntity get product => _product;

  void _updateData(product) {
    _product = product;
    notifyListeners();
  }

  void showProductDetails(ProductEntity product) {
    _updateData(product);
    _key.currentState!.openDrawer();
  }
}
