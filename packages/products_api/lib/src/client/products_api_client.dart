import 'package:dio/dio.dart';
import 'package:products_api/src/model/product.dart';
import 'package:retrofit/retrofit.dart';

import '../model/models.dart';

part 'products_api_client.g.dart';

@RestApi(baseUrl: 'https://dog.ceo/api')
abstract class ProductsApiClient {
  factory ProductsApiClient(Dio dio, {String? baseUrl}) = _ProductsApiClient;

  @GET('/breeds/image/random')
  Future<List<ProductApi>> fetchProducts();
}
