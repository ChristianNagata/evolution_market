import 'dart:convert';
import 'package:evolution_market/layers/data/datasources/user_datasource/user_datasource.dart';
import 'package:evolution_market/layers/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserDatasourceImpl implements UserDatasource {
  final String baseUrl = 'https://evolutionsoft.dev.br:7777';

  @override
  Future<UserModel> getUserData(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;

      String path = '$baseUrl/usuarios/$id';

      Map<String, String> headers = {'Authorization': 'Bearer $token'};

      var response = await http.get(Uri.parse(path), headers: headers);

      final Map<String, dynamic> parsed = json.decode(response.body) as Map<String, dynamic>;

      UserModel result = UserModel.fromMap(parsed);

      return result;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }
}
