import 'package:flutter/material.dart';
import 'product.dart';

//  Here is the products class with ChangeNotifier
class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  var _showFavoriteOnly = false;

  //  Here is getter to access the parivate class _item......
  List<Product> get items {
    if (_showFavoriteOnly) {
      // This fn return all the product whos vlaue isFavorite is true...πππ
      return _items.where((product) => product.isFavorite).toList();
    }
    return [..._items];
  }

//  In a Dart one thig is import is data type you have to define a currect datatype....πΊπΊ
  Product findById(String productId) {
    return _items.firstWhere((prod) => prod.id == productId);
    // ...
  }

  List<Product> get showFavirot {
    return _items.where((product) => product.isFavorite).toList();
  }

//  When we call this fn this will change the value of showFavorite variable..
  // void showOnlyFavorite() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   //  Here notify rebuild the products and change the items array ...
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    // Here we have to first add model class then extract the value from product map
    final neWProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);

    _items.insert(0, neWProduct);

    notifyListeners();
  }

  void updateProduct(String id, Product newproduct) {
    final productIndex = _items.indexWhere((element) => element.id == id);
    if (productIndex <= 0) {
      _items[productIndex] = newproduct;
    } else {
      print('...');
    }
    notifyListeners();
  }

// use for delete the product....
  void deleteSignalProduct(String id) {
    print('deletefn');
    // RemoveWhere delete the all data when condition is meet..
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
