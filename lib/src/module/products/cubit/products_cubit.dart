import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/src/base/app_cubit/base_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../base/app_cubit/base_state.dart';
import '../../../util/exception/failure.dart';
import '../model/product.dart';
import '../repository/products_repository.dart';

part 'product_state.dart';

part 'products_cubit.g.dart';

class ProductsCubit extends BaseCubit<ProductState> {
  final ProductsRepository _productsRepository;

  ProductsCubit(ProductsRepository productsRepository)
      : _productsRepository = productsRepository,
        super(ProductState());

  void fetchProducts() async {
    executeRequest(request: _productsRepository.fetchProducts(), success: (Right<Failure, List<Product>> products) {
      emit(state.copyWith(products: products.value));
    });
  }

  @override
  void onChange(Change<ProductState> change) {
    logger.i('PrCubit onChange: $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e('PrCubit onError', error, stackTrace);
    super.onError(error, stackTrace);
  }
}
