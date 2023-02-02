import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductApi {
  final int id;
  final String name;
  final String description;
  final double price;

  ProductApi({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductApi.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}