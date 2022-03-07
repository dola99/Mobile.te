import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobility/models/watch.dart';

class Watches with ChangeNotifier {
  List<Watch> _items = [];
  List<Watch> get items {
    return [..._items];
  }

  Watch findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/watch.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Watch> loadedProduct = [];
      extractedData.forEach((key, value) {
        value as Map<String, dynamic>;
        loadedProduct.add(
          Watch(
            id: key,
            name: value["Name"].toString(),
            images: value["images"].toString(),
            price: value["Price"].toString(),
            alwayswork: value['Always Work'].toString(),
            battery: value['battery'].toString(),
            blutoothversion: value['Bultooth Ver'].toString(),
            brand: value['brand'].toString(),
            prototype: value['Protatype'].toString(),
            colors: value['Color'].toString(),
            comatabilty: value['Comatabilty'].toString(),
            dimensios: value['Dimensios'].toString(),
            mainIages: value['Main Image'].toString(),
            memory: value['Memory'].toString(),
            os: value['Os'].toString(),
            screensize: value['Screen Size'].toString(),
            screentype: value['Screen Type'].toString(),
            type: value['Type'].toString(),
            warranty: value['Warrenty'].toString(),
            waterproof: value['Water Proof'].toString(),
            weight: value['Weight'].toString(),
            buyjumia: value['buy Jumia'].toString(),
            buynoon: value['buy Noon'].toString(),
            buysouq: value['buy Souq'].toString(),
          ),
        );
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
