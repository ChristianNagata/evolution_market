import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:evolution_market/core/utils/custom_dio.dart';
import 'package:evolution_market/layers/data/datasources/auth_datasource/auth_datasource.dart';
import 'package:evolution_market/layers/data/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<void> login(AuthModel auth) async {
    final Dio dio = CustomDio().instance;
    const String path = 'http://evolutionsoft.dev.br:7777/auth/login';

    var url = Uri.https('evolutionsoft.dev.br:7777', 'auth/login');

    var response = await http.post(url, body: auth.toMap());

    print(auth.toMap());
    print('STATUS CODE = ${response.statusCode}');
    //print(response.data.toString());
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
  }
}
