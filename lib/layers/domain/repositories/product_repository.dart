import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<ProductEntity> getProduct(String id);

  Future<List<ProductEntity>> getProducts(int page, int limit);
}
