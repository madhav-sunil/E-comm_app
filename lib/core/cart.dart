import 'package:e_comm_app/models/product.dart';

class Cart {
  static Map<Product, int> items;
  static addToCart(Product product, int count) {
    if (items.containsKey(product)) {
      items[product] += count;
    } else {
      items.putIfAbsent(product, () => count);
    }
  }

  static removeFromCart(Product product, int count) {
    if (items.containsKey(product)) {
      items[product] -= count;
      if (items[product] <= 0) {
        items.remove(product);
      }
    }
  }
}
