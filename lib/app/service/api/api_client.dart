import 'package:dio/dio.dart';

import 'interceptor/dio_interceptor.dart';

class ApiClient {
  static Dio dio = Dio();

  ApiClient() {
    dio.options.baseUrl = "baseUrl";
    dio.interceptors.add(DioInterceptor());
    dio.options.connectTimeout = 5000;
  }
}
