import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/tobbanner.dart';

class Topbanners with ChangeNotifier {
  List<TopBanner> _itemsss = [];

  List<TopBanner> get itemsss {
    return [..._itemsss];
  }

  TopBanner findById(String id) {
    return _itemsss.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/topbanner.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<TopBanner> loadedProductsss = [];
      extractedData.forEach((prodId, prodData) {
        loadedProductsss.add(TopBanner(
          id: prodId,
          idproduct: prodData['idProduct'],
          imageUrl: prodData['imageUrl'],
        ));
      });
      _itemsss = loadedProductsss;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
