

import 'package:dio/dio.dart';

import 'core/utils/custom_dio.dart';

Future<void> main() async {

  final Dio dio = CustomDio().instance;
  const String path = 'https://evolutionsoft.dev.br:7777/auth/logout';

  var response = await dio.get(path);

  print(response.headers);

}