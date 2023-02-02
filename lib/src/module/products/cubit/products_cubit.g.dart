// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductState _$ProductStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductState',
      json,
      ($checkedConvert) {
        final val = ProductState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$ProductStatusEnumMap, v) ??
                  ProductStatus.initial),
          product: $checkedConvert(
              'product',
              (v) => v == null
                  ? null
                  : Product.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ProductStateToJson(ProductState instance) =>
    <String, dynamic>{
      'status': _$ProductStatusEnumMap[instance.status]!,
      'product': instance.product,
    };

const _$ProductStatusEnumMap = {
  ProductStatus.initial: 'initial',
  ProductStatus.loading: 'loading',
  ProductStatus.success: 'success',
  ProductStatus.failure: 'failure',
};
