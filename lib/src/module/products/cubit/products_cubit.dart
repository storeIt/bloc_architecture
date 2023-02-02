import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/product.dart';
import '../repository/products_repository.dart';

part 'products_cubit.g.dart';
part 'product_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  final ProductsRepository productsRepository;

  ProductsCubit(this.productsRepository) : super(const ProductState());
}
