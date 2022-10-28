import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:evolution_market/core/exceptions.dart';
import 'package:evolution_market/core/utils/custom_dio.dart';
import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<String> login(AuthModel auth) async {
    try {
      final Dio dio = CustomDio().instance;
      const String path = 'https://evolutionsoft.dev.br:7777/auth/login';

      // Map<String, String> headers = {
      //   'Content-Type': 'application/json; charset=UTF-8',
      // };
      //
      // var response = await http.post(
      //   Uri.parse(path),
      //   headers: headers,
      //   body: jsonEncode(auth.toMap()),
      // );
      var response = await dio.post(path, data: auth.toMap());

      if (response.statusCode == 204) {
        String token = response.headers['authorization']!.first.toString();
        return token;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<void> logout() async {
    final Dio dio = CustomDio().instance;
    const String path = 'https://evolutionsoft.dev.br:7777/auth/logout';
  }
}
