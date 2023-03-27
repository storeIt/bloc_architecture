import 'dart:ui';

import 'package:bloc_architecture/src/base/model/base_response.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/material/color.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseResponse {
  final int id;
  @JsonKey(name: 'title')
  final String name;
  final String category;
  @JsonKey(name: 'description')
  final String details;
  @JsonKey(name: 'image')
  final String imageUrl;
  final double price;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Color dominantColor;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late Image? fetchedImage;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.details,
    required this.imageUrl,
    required this.price,
    this.dominantColor = defaultDominantColor,
    this.fetchedImage,
  });

  static Product empty = Product(
    id: 0,
    name: '',
    category: '',
    details: '',
    imageUrl: '',
    price: 0.0,
    dominantColor: defaultDominantColor,
  );

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? details,
    String? imageUrl,
    double? price,
    Color? dominantColor,
    Image? fetchedImage,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      details: details ?? this.details,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      dominantColor: dominantColor ?? this.dominantColor,
      fetchedImage: fetchedImage ?? this.fetchedImage,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  List<Object?> get props => [id, name, details, category, imageUrl, price, dominantColor, fetchedImage];
}