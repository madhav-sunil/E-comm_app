import 'package:e_comm_app/data/models/product.dart';

class Cart {
  static Map<Product, int> items = {};

  /// Takes [product] and [count] as Arguments
  /// and Adds to [Cart].
  static addToCart(Product product, int count) {
    if (items.containsKey(product)) {
      items[product] += count;
    } else {
      items.putIfAbsent(product, () => count);
    }
  }

  /// Take [product] as Argument and
  /// Delets it from [Cart].
  static removeFromCart(Product product) {
    if (items.containsKey(product)) {
      items[product] -= 1;
      if (items[product] <= 0) {
        items.remove(product);
      }
    }
  }
}
