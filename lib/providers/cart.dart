import 'package:flutter/foundation.dart';

//  This is model for cart
class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

//  This fn return the all item length which show on the appbar....
  int get itemCount {
    print('click cart btn');
    return _items.length;
  }

//  This fn return the total amount of a product one Product can be purchase two time....
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cardItem) {
      total += cardItem.price * cardItem.quantity;
    });
    return total;
  }

//  This fn is write for add the item to item map ......
  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        // On this bases of ID we are checking item is exist or not
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    print('ID..............' + productId);
    _items.remove(productId);
    notifyListeners();
  }

  void clearAllProduct() {
    _items = {};
    notifyListeners();
  }
}
