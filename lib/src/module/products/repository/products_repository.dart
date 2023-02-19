import 'package:bloc_architecture/src/base/repository/base_repository.dart';
import 'package:bloc_architecture/src/module/products/model/product.dart';
import 'package:bloc_architecture/src/util/exception/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../util/service/rest_api_service.dart';
import '../../../util/service/retrofit_service.dart';
import '../../../util/service/service_locator.dart';

class ProductsRepository extends BaseRepository {
  final RestClient _apiClient;

  ProductsRepository() : _apiClient = locator<RetrofitService>().apiClient;

  Future<List<Product>> fetchProducts()  {
    return  _apiClient.fetchProducts();
  }
}
