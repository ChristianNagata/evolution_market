import 'package:dartz/dartz.dart';
import 'package:evolution_market/core/exceptions.dart';
import 'package:evolution_market/core/failures.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/models/product_model.dart';
import 'package:evolution_market/layers/domain/entities/product_entity.dart';
import 'package:evolution_market/layers/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(this._products);

  final ProductDatasource _products;

  @override
  Future<Either<FailureEntity, List<ProductEntity>>> getProducts(
    int page,
    int limit,
  ) async {
    try {
      List<ProductModel> productModel =
          await _products.getProducts(page, limit);
      List<ProductEntity> products =
          productModel.map<ProductEntity>((e) => e.toEntity()).toList();
      return Right(products);
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    }
  }
}
