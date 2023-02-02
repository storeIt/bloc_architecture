// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductApi _$ProductFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Product',
      json,
      ($checkedConvert) {
        final val = ProductApi(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );
