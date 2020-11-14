import 'package:flutter/cupertino.dart';
import './watch.dart';
import '../models/http_exception.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Watches with ChangeNotifier {
  List<Watch> _items = [];
  List<Watch> get items {
    return [..._items];
  }

  Watch findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    const url = 'https://mobile-63038.firebaseio.com/watch.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Watch> loadedProduct = [];
      extractedData.forEach((key, value) {
        loadedProduct.add(
          Watch(
            id: key,
            name: value["Name"],
            images: value["images"],
            price: value["Price"],
            alwayswork: value['Always Work'],
            battery: value['battery'],
            blutoothversion: value['Bultooth Ver'],
            brand: value['brand'],
            prototype: value['Protatype'],
            colors: value['Color'],
            comatabilty: value['Comatabilty'],
            dimensios: value['Dimensios'],
            mainIages: value['Main Image'],
            memory: value['Memory'],
            os: value['Os'],
            screensize: value['Screen Size'],
            screentype: value['Screen Type'],
            type: value['Type'],
            warranty: value['Warrenty'],
            waterproof: value['Water Proof'],
            weight: value['Weight'],
            buyjumia: value['buy Jumia'],
            buynoon: value['buy Noon'],
            buysouq: value['buy Souq'],
          ),
        );
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
