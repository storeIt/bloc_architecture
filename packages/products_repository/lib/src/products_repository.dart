import 'package:dio/dio.dart';
import 'package:products_api/products_api.dart';

import '../products_repository.dart';

class ProductsRepository {
  final ProductsApiClient _apiClient;

  ProductsRepository() : _apiClient = ProductsApiClient(Dio());

  Future<List<Product>> fetchProducts() async {
    print('products repository fetchProducts() 1');
    final response = await _apiClient.fetchProducts();
    // .catchError(ExceptionHandler.handleException);
    print('products repository fetchProducts() 2');
    // List<Product> products = response.map(
    final products = response.map(
      (p) => Product(
        id: p.id,
        name: p.name,
        description: p.description,
        price: p.price,
      ),
    );
    return products as List<Product>;
  }
}
