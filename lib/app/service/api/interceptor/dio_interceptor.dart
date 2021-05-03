import 'package:dio/dio.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
  }

  @override
  Future onResponse(Response response) async {
    //200
    //201
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
  }

  @override
  Future onError(DioError e) async {
    //Exception
    print("ERROR[${e.response?.statusCode}] => PATH: ${e.request.path}");
  }
}
