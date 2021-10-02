import 'package:flutter/material.dart';
import 'package:mobility/models/product.dart';

class Compare with ChangeNotifier {
  Product _product1;
  Product _product2;
  Product _searchProduct;
  Product get product1 {
    return _product1;
  }

  Product get product2 {
    return _product2;
  }

  Product get searchbar {
    return _searchProduct;
  }

  // ignore: missing_return
  Future<Product> addproduct(String id, List<Product> items) {
    if (_product1 == null) {
      addproduct1(id, items);
      notifyListeners();
    } else if (_product2 == null) {
      addproduct2(id, items);
      notifyListeners();
    } else {}

    notifyListeners();
  }

  // ignore: missing_return
  Future<void> addproduct1(String id, List<Product> items) {
    _product1 = items.firstWhere((element) => element.id == id);
    print(1);
  }

  // ignore: missing_return
  Future<void> addproduct2(String id, List<Product> items) {
    _product2 = items.firstWhere((element) => element.id == id);
    print(2);
  }

  Future<Product> SearchProduct(String id, List<Product> items) {
    _searchProduct = items.firstWhere((element) => element.id == id);
    notifyListeners();
  }

  // ignore: missing_return
  Future<void> removeproduct(int product) {
    // ignore: unnecessary_statements
    if (product == 1) {
      _product1 = null;
      notifyListeners();
    } else if (product == 2) {
      _product2 = null;
      notifyListeners();
    }
  }
}
