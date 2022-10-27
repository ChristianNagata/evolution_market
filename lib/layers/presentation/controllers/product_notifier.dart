import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

String _lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

String _image1 =
    'https://images.newscientist.com/wp-content/uploads/2021/07/19142457/20-july_tomato-nervous-system.jpg?width=800';

String _image2 =
    'https://img-21.ccm2.net/xQsG1nfqxhxYg9n9I_bc_F_XJAk=/cd169fee2b044bfd82a9c43909c3e56f/ccm-faq/1179706.jpg';

String _image3 =
    'https://minhasaude.proteste.org.br/wp-content/uploads/2022/10/muitas-laranjas.png';

String _image4 =
    'https://sportlife.com.br/wp-content/uploads/2021/11/abacaxi-1.jpg';

class ProductNotifier with ChangeNotifier {
  List<ProductEntity> _products = [
    ProductEntity(
      name: 'Tomate',
      description: _lorem,
      imagePath: _image1,
      formattedPrice: '23,90',
      numberOfProducts: 0,
      isOnSale: true,
    ),
    ProductEntity(
      name: 'Melancia',
      description: _lorem,
      imagePath: _image2,
      formattedPrice: '33,80',
      numberOfProducts: 0,
      isOnSale: false,
    ),
    ProductEntity(
      name: 'Laranja',
      description: _lorem,
      imagePath: _image3,
      formattedPrice: '10,90',
      numberOfProducts: 0,
      isOnSale: true,
    ),
    ProductEntity(
      name: 'Abacaxi',
      description: _lorem,
      imagePath: _image4,
      formattedPrice: '7,70',
      numberOfProducts: 0,
      isOnSale: false,
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
