import 'package:flutter/material.dart';
import 'package:mobility/models/product.dart';

class Compare with ChangeNotifier {
  Product? _product1;
  Product? _product2;
  Product? _searchProduct;
  Product? get product1 {
    return _product1;
  }

  Product? get product2 {
    return _product2;
  }

  Product? get searchbar {
    return _searchProduct;
  }

  Future<void> addproduct(String? id, List<Product> items) async {
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
  Future<void> addproduct1(String? id, List<Product> items) async {
    _product1 = items.firstWhere((element) => element.id == id);
  }

  // ignore: missing_return
  Future<void> addproduct2(String? id, List<Product> items) async {
    _product2 = items.firstWhere((element) => element.id == id);
    debugPrint('2');
  }

  Future<void> searchProduct(String id, List<Product> items) async {
    _searchProduct = items.firstWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> removeproduct(int product) async {
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
