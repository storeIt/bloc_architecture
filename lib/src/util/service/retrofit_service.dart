import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'rest_api_service.dart';

class RetrofitService {
  static final _dio = getDio();
  static const int _apiTimeout = 3000;

  final RestClient _apiClient = RestClient(_dio);

  static Dio getDio() {
    Dio dio = getCleanDio();
    dio.options.connectTimeout = const Duration(milliseconds: _apiTimeout);
    dio.options.receiveTimeout = const Duration(milliseconds: _apiTimeout);
    dio.options.sendTimeout = const Duration(milliseconds: _apiTimeout);

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          request: false,
        ),
      );
    }
    return dio;
  }

  static Dio getCleanDio() {
    Dio dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    return dio;
  }

  RestClient get apiClient => _apiClient;
}
