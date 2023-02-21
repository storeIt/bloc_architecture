import 'package:bloc_architecture/src/base/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseResponse {
  final int id;
  final String name;
  @JsonKey(name: 'description')
  final String details;
  final String price;

  const Product({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
  });

  static const empty = Product(
    id: 0,
    name: '',
    details: '',
    price: '',
  );

  Product copyWith({
    int? id,
    String? name,
    String? details,
    String? price,
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
  List<Object?> get props => [id, name, details, price];
}
