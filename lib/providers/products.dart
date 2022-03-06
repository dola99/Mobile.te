import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findbyId(String? id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/product.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProduct = [];
      extractedData.forEach((key, value) {
        loadedProduct.add(Product(
          lightTopScreen: value['LightTopScreen'],
          fbscod: value['fbscod'],
          aduio: value['Audio'],
          antutue: value['Antutu'],
          fbspubg: value['fbspubg'],
          jumiabuy: value['jumiabuy'],
          noonbuy: value['noonbuy'],
          rescod: value['rescod'],
          respubg: value['respubg'],
          souqbuy: value['souqbuy'],
          capstiybattery: value['capacitybattery'],
          category: value["category"],
          cpu: value['cpu'],
          frontcamera: value["front camera"],
          more: value['More'],
          gpu: value["gpu"],
          id: key,
          name: value["Name"],
          os: value["os"],
          ram: value["Ram"],
          rearcamera: value["Rear Camera"],
          screen: value["Screen"],
          size: value["Size"],
          space: value["Space"],
          speedofcharge: value["Speed of Charge"],
          topScreen: value["Top Screen"],
          images: value["images"],
          mainImages: value["Main Image"],
          price: value["Price"],
        ));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
