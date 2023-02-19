part of 'products_cubit.dart';

enum ProductStatus { initial, loading, success, failure }

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;

  bool get isLoading => this == ProductStatus.loading;

  bool get isSuccess => this == ProductStatus.success;

  bool get isFailure => this == ProductStatus.failure;
}

@JsonSerializable()
class ProductState extends BaseState {
  final ProductStatus status;
  final List<Product> products;

  ProductState({
    this.status = ProductStatus.initial,
    List<Product>? products,
  }) : products = products ?? [];

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, products];
}
