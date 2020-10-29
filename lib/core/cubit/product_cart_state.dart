part of 'product_cart_cubit.dart';

abstract class ProductCartState extends Equatable {
  const ProductCartState();

  @override
  List<Object> get props => [];
}

class ProductCartInitial extends ProductCartState {}

class ProductLoading extends ProductCartState {
  const ProductLoading();
}

class ProductLoaded extends ProductCartState {
  final List<Product> products;

  ProductLoaded(this.products);
}

//!This State is not used in this Example.
class CartUpdated extends ProductCartState {}
