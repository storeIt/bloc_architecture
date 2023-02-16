import 'package:bloc_architecture/src/base/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
// TODO BaseResponse extends Equatable and child fields should be final
class Product extends BaseResponse {
  final String id;
  final String name;
  final String details;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
  });

  static const empty = Product(
    id: '',
    name: '',
    details: '',
    price: 0,
  );

  Product copyWith({
    String? id,
    String? name,
    String? details,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      price: price ?? this.price,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  List<Object> get props => [id, name, details, price];
}
