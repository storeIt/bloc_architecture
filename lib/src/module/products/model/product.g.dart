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
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('title', (v) => v as String),
          category: $checkedConvert('category', (v) => v as String),
          details: $checkedConvert('description', (v) => v as String),
          imageUrl: $checkedConvert('image', (v) => v as String),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'name': 'title',
        'details': 'description',
        'imageUrl': 'image'
      },
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'category': instance.category,
      'description': instance.details,
      'image': instance.imageUrl,
      'price': instance.price,
    };
