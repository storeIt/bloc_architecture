// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Product',
      json,
      ($checkedConvert) {
        final val = Product(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('product_name', (v) => v as String),
          details: $checkedConvert('details', (v) => v as String),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'productName': 'product_name'},
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.name,
      'details': instance.details,
      'price': instance.price,
    };
