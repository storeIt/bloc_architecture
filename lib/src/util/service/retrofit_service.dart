import 'package:bloc_architecture/src/util/service/rest_api_service.dart';
import 'package:dio/dio.dart';

class RetrofitService {
  static final _dio = getDio();
  static const int apiTimeout = 3000;

  final RestClient _apiClient = RestClient(_dio);

  static Dio getDio() {
    Dio dio = getCleanDio();
    dio.options.connectTimeout = apiTimeout;
    dio.options.receiveTimeout = apiTimeout;
    return dio;
  }

  static Dio getCleanDio() {
    Dio dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    return dio;
  }

  RestClient get apiClient => _apiClient;
}