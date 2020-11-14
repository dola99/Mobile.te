import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'tablet.dart';
import 'package:http/http.dart' as http;

class Tablets with ChangeNotifier {
  List<Tablet> _items = [];

  List<Tablet> get items {
    return [..._items];
  }

  Tablet findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    const url = 'https://mobile-63038.firebaseio.com/tablet.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Tablet> loadedProduct = [];
      extractedData.forEach((key, value) {
        loadedProduct.add(Tablet(
          fbscod: value['fbscod'],
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
