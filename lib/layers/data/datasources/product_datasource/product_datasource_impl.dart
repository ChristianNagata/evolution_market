import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:evolution_market/core/utils/custom_dio.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final String baseUrl = 'https://evolutionsoft.dev.br:7777';

  @override
  Future<ProductModel> getProduct(String id) async {
    Dio dio = CustomDio.withAuthentication().instance;
    String path = '$baseUrl/produtos/$id';

    var response = await dio.get(path);

    final parsed = json.decode(response.data).cast<Map<String, dynamic>>();

    ProductModel result =
        parsed.map<ProductModel>((json) => ProductModel.fromMap(json));

    return result;
  }

  @override
  Future<List<ProductModel>> getProducts(int page, int limit) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;

      String path = '$baseUrl/produtos?page=$page&limit=$limit';

      Map<String, String> headers = {'Authorization': 'Bearer $token'};

      var response = await http.get(Uri.parse(path), headers: headers);

      final List parsed = json.decode(response.body)['result'] as List;

      List<ProductModel> result = parsed
          .map<ProductModel>((json) => ProductModel.fromMap(json))
          .toList();

      return result;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

// @override
// Future<List<ProductModel>> getProducts(int page, int limit) async {
//   try {
//     Dio dio = CustomDio.withAuthentication().instance;
//     String path = '$baseUrl/produtos?page=$page&limit=$limit';
//
//     var response = await dio.get(path);
//
//     print(response.statusCode);
//
//     final parsed = json.decode(response.data).cast<Map<String, dynamic>>();
//
//     List<ProductModel> result = parsed
//         .map<ProductModel>((json) => ProductModel.fromMap(json))
//         .toList();
//
//     return result;
//   } catch (e) {
//     print(e);
//     throw Exception();
//   }
// }
}
