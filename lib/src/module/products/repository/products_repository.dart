import '../../../base/repository/base_repository.dart';
import '../../../util/service/rest_api_service.dart';
import '../../../util/service/retrofit_service.dart';
import '../../../util/service/service_locator.dart';
import '../model/product.dart';

class ProductsRepository extends BaseRepository {
  final RestClient _apiClient;

  ProductsRepository() : _apiClient = locator<RetrofitService>().apiClient;

  Future<List<Product>> fetchProducts() {
    return _apiClient.fetchProducts();
  }
}
