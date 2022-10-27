import 'dart:convert';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasourceImpl implements ProductDatasource {
  String bearer = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
      'eyJpZCI6MSwiZW1haWwiOiJ1c3VhcmlvMUBlbWFpbC5jb20iLCJpYXQiOjE2NjY4ODc4MjYsImV4cCI6MTY2Njk3NDIyNn0.'
      'MzI4_siWZ3ODOeTlv-P_ahMAOjydVKdKvRKI3i1JOn4';

  @override
  Future<ProductModel> getProduct(String id) async {
    Uri uri = Uri.parse('http://evolutionsoft.dev.br:7777/produtos/$id');
    final response = await http.get(uri, headers: {'Authorization': bearer});

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    ProductModel result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json));

    return result;
  }

  @override
  Future<List<ProductModel>> getProducts(int page, int limit) async {
    Uri uri = Uri.parse(
        'http://evolutionsoft.dev.br:7777/produtos?page=$page&limit=$limit');
    final response = await http.get(uri, headers: {'Authorization': bearer});

    print(response.statusCode);

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    List<ProductModel> result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json)).toList();

    return result;
  }
}
