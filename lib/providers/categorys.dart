import 'dart:convert';
import '../models/http_exception.dart';
import 'categorey.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Categorys with ChangeNotifier {
  List<Category> _itemss = [];

  List<Category> get itemss {
    return [..._itemss];
  }

  Category findbyId(String id) {
    return _itemss.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    const url = 'https://mobile-63038.firebaseio.com/category.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Category> loadedProduct = [];
      extractedData.forEach((key, value) {
        loadedProduct.add(Category(
          birthday: value["birthday"],
          color: value["Color"],
          id: key,
          logo: value['Logo'],
          madeIn: value["Made In"],
          name: value["Name"],
          rateinEgypt: value["Rate In Egypt"],
          rateintheworld: value["Rate In The World"],
        ));
      });
      _itemss = loadedProduct;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
