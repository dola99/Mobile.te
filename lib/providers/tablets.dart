import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobility/models/tablet.dart';

class Tablets with ChangeNotifier {
  List<Tablet> _items = [];

  List<Tablet> get items {
    return [..._items];
  }

  Tablet findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/tablet.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Tablet> loadedProduct = [];
      extractedData.forEach((key, value) {
        value as Map<String, dynamic>;
        loadedProduct.add(
          Tablet(
            lightTopScreen: value['LightTopScreen'].toString(),
            fbscod: value['fbscod'].toString(),
            fbspubg: value['fbspubg'].toString(),
            aduio: value['Aduio'].toString(),
            antutu: value['Antutu'].toString(),
            jumiabuy: value['jumiabuy'].toString(),
            noonbuy: value['noonbuy'].toString(),
            rescod: value['rescod'].toString(),
            respubg: value['respubg'].toString(),
            souqbuy: value['souqbuy'].toString(),
            capstiybattery: value['capacitybattery'].toString(),
            category: value["category"].toString(),
            cpu: value['cpu'].toString(),
            frontcamera: value["front camera"].toString(),
            gpu: value["gpu"].toString(),
            id: key,
            more: value['More'].toString(),
            name: value["Name"].toString(),
            os: value["os"].toString(),
            ram: value["Ram"].toString(),
            rearcamera: value["Rear Camera"].toString(),
            screen: value["Screen"].toString(),
            size: value["Size"].toString(),
            space: value["Space"].toString(),
            speedofcharge: value["Speed of Charge"].toString(),
            topScreen: value["Top Screen"].toString(),
            images: value["images"].toString(),
            mainImages: value["Main Image"].toString(),
            price: value["Price"].toString(),
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
