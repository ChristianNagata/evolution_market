import 'dart:convert';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasourceImpl implements ProductDatasource {
  String bearer =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJ1c3VhcmlvMUBlbWFpbC5jb20iLCJpYXQiOjE2NjY4MzUyOTQsImV4cCI6MTY2NjkyMTY5NH0.X2YrmDc6chTZI6AG8ZElnqfsA4G1m6OhaOpx8ubo2Mg';

  @override
  Future<ProductModel> getProduct(String id) async {
    Uri uri = Uri.parse('http://evolutionsoft.dev.br:7777/produtos/$id');
    final response = await http.get(uri, headers: {'authorization': bearer});

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    ProductModel result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json));

    return result;
  }

  @override
  Future<List<ProductModel>> getProducts(int page, int limit) async {
    Uri uri = Uri.parse(
        'http://evolutionsoft.dev.br:7777/produtos?page=$page&limit=$limit');
    final response = await http.get(uri, headers: {'authorization': bearer});

    print(response.statusCode);

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    List<ProductModel> result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json)).toList();

    return result;
  }
}
