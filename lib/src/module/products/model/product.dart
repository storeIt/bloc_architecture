import 'package:bloc_architecture/src/base/model/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseResponse {
  final String id;
  final String productName;
  final String details;
  final double price;

  const Product({
    required this.id,
    required this.productName,
    required this.details,
    required this.price,
  });

  static const empty = Product(
    id: '',
    productName: '',
    details: '',
    price: 0,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  List<Object> get props => [id, productName, details, price];
}
