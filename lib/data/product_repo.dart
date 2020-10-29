import 'models/product.dart';

///
///  ProductRepository which is to be implemented
///
abstract class ProductRepository {
  // To be implemented as needed
  Future<List<Product>> fetchProduct();
}

///
/// A Fake ProductRepository for development Purpose
///
class FakeProductRepository implements ProductRepository {
  List<Product> productList = [
    Product(
      name: 'Acer Nitro 7',
      cost: 72000.0,
      description: 'Acers Nitro 7 is an awesome laptop',
      thumbnail:
          'https://images-na.ssl-images-amazon.com/images/I/71pmeZHalxL._SL1500_.jpg',
    ),
    Product(
      name: 'Acer Nitro 5',
      cost: 62000.0,
      description: 'Acers Nitro 5 is an awesome laptop',
      thumbnail:
          'https://images-na.ssl-images-amazon.com/images/I/81IXuyeJhYL._SL1500_.jpg',
    ),
    Product(
      name: 'Acer Nitro 4',
      cost: 44000.0,
      description: 'Acers Nitro 4 is an awesome laptop',
      thumbnail:
          'https://images-na.ssl-images-amazon.com/images/I/81RNxe%2BQTDL._SL1500_.jpg',
    )
  ];

  @override
  Future<List<Product>> fetchProduct() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return productList;
      },
    );
  }
}
