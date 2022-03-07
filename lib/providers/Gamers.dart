import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobility/models/gamer.dart';

class Gamers with ChangeNotifier {
  List<Gamer> _items = [];

  List<Gamer> get items {
    return [..._items];
  }

  Gamer findbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchandsetProducts() async {
    final url = Uri.parse('https://mobile-63038.firebaseio.com/Gamer.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Gamer> loadedProduct = [];
      extractedData.forEach((key, value) {
        value as Map<String, dynamic>;
        loadedProduct.add(
          Gamer(
            audio: extractedData['Audio'].toString(),
            antutu: extractedData['Antutu'].toString(),
            fbscod: extractedData['fbscod'].toString(),
            fbspubg: extractedData['fbspubg'].toString(),
            jumiabuy: extractedData['jumiabuy'].toString(),
            noonbuy: extractedData['noonbuy'].toString(),
            rescod: extractedData['rescod'].toString(),
            respubg: extractedData['respubg'].toString(),
            souqbuy: extractedData['souqbuy'].toString(),
            capstiybattery: extractedData['capacitybattery'].toString(),
            category: extractedData["category"].toString(),
            lighttopscreen: extractedData['LghtTopScreen'].toString(),
            cpu: extractedData['cpu'].toString(),
            frontcamera: extractedData["front camera"].toString(),
            gpu: extractedData["gpu"].toString(),
            more: extractedData['More'].toString(),
            id: key,
            name: extractedData["Name"].toString(),
            os: extractedData["os"].toString(),
            ram: extractedData["Ram"].toString(),
            rearcamera: extractedData["Rear Camera"].toString(),
            screen: extractedData["Screen"].toString(),
            size: extractedData["Size"].toString(),
            space: extractedData["Space"].toString(),
            speedofcharge: extractedData["Speed of Charge"].toString(),
            topScreen: extractedData["Top Screen"].toString(),
            images: extractedData["images"].toString(),
            mainImages: extractedData["Main Image"].toString(),
            price: extractedData["Price"].toString(),
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
