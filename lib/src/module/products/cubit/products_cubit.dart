import 'dart:async';
import 'dart:ui' as ui;

import 'package:bloc_architecture/src/base/app_cubit/base_cubit.dart';
import 'package:bloc_architecture/src/constant/material/color.dart';
import 'package:bloc_architecture/src/util/helper/color_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void fetchProducts<T>(BuildContext context) async {
    executeRequest(
        context: context,
        request: _productsRepository.fetchProducts(),
        success: (Right<Object, T> products) {
          emit(state.copyWith(products: products.value as List<Product>));
        });
  }

  Stream<Color> getDominantColor(ui.Image image) async* {
    Color color = defaultDominantColor;
    ColorHelper.getDominantColor(image).then((value) {
      color = value;
    }) as Color;
    yield color;
  }
}
