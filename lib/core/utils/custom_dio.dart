import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  late Dio _dio;

  CustomDio() {
    _dio = Dio();
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onRespose,
        onError: _onError,
      ),
    );
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options,
      RequestInterceptorHandler interceptorHandler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    options.headers['Authorization'] = token;
  }

  _onError(DioError e, ErrorInterceptorHandler eHandler) {
    return e;
  }

  _onRespose(Response r, ResponseInterceptorHandler rHandler) {
    print('########### Response Log');
    print(r.data);
    print('########### Response Log');
  }
}
