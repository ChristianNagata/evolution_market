import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:evolution_market/core/utils/custom_dio.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasourceImpl implements ProductDatasource {
  final String baseUrl = 'https://evolutionsoft.dev.br:7777';

  @override
  Future<ProductModel> getProduct(String id) async {
    Dio dio = CustomDio.withAuthentication().instance;
    String path = '$baseUrl/produtos/$id';

    // final response = await http.get(
    //   Uri.parse(path),
    //   headers: {'Authorization': bearer},
    // );

    var response = await dio.get(path);

    final parsed = json.decode(response.data).cast<Map<String, dynamic>>();

    ProductModel result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json));

    return result;
  }

  @override
  Future<List<ProductModel>> getProducts(int page, int limit) async {
    Dio dio = CustomDio.withAuthentication().instance;
    String path = '$baseUrl/produtos?page=$page&limit=$limit';

    // final response = await http.get(
    //   Uri.parse(path),
    //   headers: {'Authorization': 'bearer'},
    // );

    var response = await dio.get(path);

    final parsed = json.decode(response.data).cast<Map<String, dynamic>>();

    List<ProductModel> result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json)).toList();

    return result;
  }
}
