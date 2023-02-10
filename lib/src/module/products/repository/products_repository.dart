import '../../../util/service/rest_api_service.dart';
import '../../../util/service/retrofit_service.dart';
import '../../../util/service/service_locator.dart';
import '../model/product.dart';

class ProductsRepository {
  final RestClient _apiClient;

  ProductsRepository() : _apiClient = locator<RetrofitService>().apiClient;

  Future<List<Product>> fetchProducts() async {
    try {
      return await _apiClient.fetchProducts();
    } on Exception {
      print('ProductsRepository on Exception');
      rethrow;
    }
  }
}
