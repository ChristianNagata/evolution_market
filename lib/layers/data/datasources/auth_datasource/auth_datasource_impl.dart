import 'package:dio/dio.dart';
import 'package:evolution_market/core/exceptions.dart';
import 'package:evolution_market/core/utils/custom_dio.dart';
import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/models/auth_model.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final String _baseUrl = 'https://evolutionsoft.dev.br:7777';

  @override
  Future<String> login(AuthModel auth) async {
    try {
      final Dio dio = CustomDio().instance;
      String path = '$_baseUrl/auth/login';

      var response = await dio.post(path, data: auth.toMap());

      String token = response.headers['authorization']!.first.toString();
      return token;
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }
}
