import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/newphone.dart';
import 'dart:convert';

class NewPhoness with ChangeNotifier {
  List<NewPhone> _items = [];

  List<NewPhone> get items {
    return [..._items];
  }

  NewPhone findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandSetsProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/NewPhone.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<NewPhone> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(NewPhone(
          id: prodId,
          color: prodData['Color'],
          idproduct: prodData["Id Product"],
          logo: prodData["Logo"],
          imageUrl: prodData['imageUrl'],
          nameofCampany: prodData["Name Of Company"],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
