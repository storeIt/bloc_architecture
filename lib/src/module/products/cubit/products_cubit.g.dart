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
          products: $checkedConvert(
              'products',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ProductStateToJson(ProductState instance) =>
    <String, dynamic>{
      'status': _$ProductStatusEnumMap[instance.status]!,
      'products': instance.products,
    };

const _$ProductStatusEnumMap = {
  ProductStatus.initial: 'initial',
  ProductStatus.loading: 'loading',
  ProductStatus.success: 'success',
  ProductStatus.failure: 'failure',
};
