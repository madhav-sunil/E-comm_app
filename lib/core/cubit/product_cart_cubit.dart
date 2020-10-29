import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:e_comm_app/data/models/product.dart';
import 'package:e_comm_app/data/product_repo.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final ProductRepository productRepository;

  ProductCartCubit(this.productRepository) : super(ProductCartInitial());

  // Gets the Products from the Repository
  Future<void> getProducts() async {
    emit(ProductLoading());
    final products = await productRepository.fetchProduct();
    emit(ProductLoaded(products));
  }
}
