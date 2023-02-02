part of 'products_cubit.dart';

enum ProductStatus { initial, loading, success, failure }

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;

  bool get isLoading => this == ProductStatus.loading;

  bool get isSuccess => this == ProductStatus.success;

  bool get isFailure => this == ProductStatus.failure;
}

@JsonSerializable()
class ProductState extends Equatable {
  final ProductStatus status;
  final Product product;

  const ProductState({
    this.status = ProductStatus.initial,
    Product? product,
  }) : product = product ?? Product.empty;

  @override
  List<Object?> get props => [];
}
