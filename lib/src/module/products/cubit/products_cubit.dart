import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../util/helper/logger_helper.dart';
import '../../../util/service/service_locator.dart';
import '../model/product.dart';
import '../repository/products_repository.dart';

part 'product_state.dart';

part 'products_cubit.g.dart';

class ProductsCubit extends Cubit<ProductState> {
  final ProductsRepository _productsRepository;
  final LoggerHelper _logger;

  ProductsCubit(ProductsRepository productsRepository)
      : _productsRepository = productsRepository,
        _logger = locator<LoggerHelper>(),
        super(ProductState());

  void fetchProducts() async {
    _logger.i('ProductsCubit fetchProducts()');
    _productsRepository.fetchProducts().then(
      (value) {
        _logger.i('ProductsCubit fetchProducts() then() $value');
        emit(state.copyWith(products: value));
      },
    ).catchError(
      (error, stack) {
        _logger.e('Exception caught in ProductsCubit fetchProducts', error, stack);
        addError(error, stack);
      },
    );
  }

  @override
  void onChange(Change<ProductState> change) {
    print('ProductsCubit onChange()');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('ProductsCubit onError() error = $error');
    locator<LoggerHelper>().e('PrCubit logger', error, stackTrace);
    super.onError(error, stackTrace);
  }
}
