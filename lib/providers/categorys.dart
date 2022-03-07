import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobility/models/categorey.dart';

class Categorys with ChangeNotifier {
  List<Category> _itemss = [];

  List<Category> get itemss {
    return [..._itemss];
  }

  Category findbyId(String id) {
    return _itemss.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/category.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Category> loadedProduct = [];
      extractedData.forEach((key, value) {
        value as Map<String, dynamic>;
        loadedProduct.add(
          Category(
            birthday: value["birthday"].toString(),
            color: value["Color"].toString(),
            id: key,
            logo: value['Logo'].toString(),
            madeIn: value["Made In"].toString(),
            name: value["Name"].toString(),
            rateinEgypt: value["Rate In Egypt"].toString(),
            rateintheworld: value["Rate In The World"].toString(),
          ),
        );
      });
      _itemss = loadedProduct;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
