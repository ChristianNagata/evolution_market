import 'dart:convert';
import 'package:evolution_market/core/exceptions.dart';
import 'package:evolution_market/layers/data/datasources/product_datasource/product_datasource.dart';
import 'package:evolution_market/layers/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final String _baseUrl = 'https://evolutionsoft.dev.br:7777';

  @override
  Future<List<ProductModel>> getProducts(int page, int limit) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';

      String path = '$_baseUrl/produtos?page=$page&limit=$limit';

      Map<String, String> headers = {'Authorization': 'Bearer $token'};

      var response = await http.get(Uri.parse(path), headers: headers);

      if (response.statusCode == 200) {
        final List parsed = json.decode(response.body)['result'] as List;
        List<ProductModel> result = parsed
            .map<ProductModel>((json) => ProductModel.fromMap(json))
            .toList();
        return result;
      } else {
        throw UnauthorizedException();
      }
    } on UnauthorizedException {
      throw UnauthorizedException();
    }
  }
}
