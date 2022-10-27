import 'package:evolution_market/layers/data/models/product_model.dart';

abstract class ProductDatasource {
  Future<ProductModel> getProduct(String id);

  Future<List<ProductModel>> getProducts(int page, int limit);
}
