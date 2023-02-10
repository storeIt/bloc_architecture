import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../util/helper/logger_helper.dart';
import '../model/product.dart';
import '../repository/products_repository.dart';

part 'product_state.dart';
part 'products_cubit.g.dart';

class ProductsCubit extends Cubit<ProductState> {
  final ProductsRepository _productsRepository;

  ProductsCubit(ProductsRepository productsRepository) :
        _productsRepository = productsRepository,
        super(ProductState());

  void fetchProducts() async {
    print('ProductsCubit fetchProducts()');
    _productsRepository.fetchProducts().then(
      (value) {
        print('ProductsCubit fetchProducts() then() $value');
        emit(state.copyWith(products: value));
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
    appLog(error, stackTrace);
    super.onError(error, stackTrace);
  }
}
