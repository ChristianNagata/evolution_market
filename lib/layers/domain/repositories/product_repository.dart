import 'package:dartz/dartz.dart';
import 'package:evolution_market/core/failures.dart';

import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<FailureEntity, List<ProductEntity>>> getProducts(
    int page,
    int limit,
  );
}
