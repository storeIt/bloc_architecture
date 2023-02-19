import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../../module/products/model/product.dart';
import '../exception/failure.dart';

part 'rest_api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/products')
  Future<List<Product>> fetchProducts();
}
