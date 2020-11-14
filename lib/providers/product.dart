import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String name;
  final String id;
  final String cpu;
  final String gpu;
  final String ram;
  final String frontcamera;
  final String rearcamera;
  final String screen;
  final String os;
  final String capstiybattery;
  final String size;
  final String space;
  final String topScreen;
  final String speedofcharge;
  final String category;
  final String images;
  final String mainImages;
  final String price ; 
  Product(
      {@required this.price,
      @required this.mainImages,
      @required this.images,
      @required this.name,
      @required this.id,
      @required this.category,
      @required this.cpu,
      @required this.gpu,
      @required this.ram,
      @required this.frontcamera,
      @required this.rearcamera,
      @required this.screen,
      @required this.os,
      @required this.capstiybattery,
      @required this.size,
      @required this.space,
      @required this.topScreen,
      @required this.speedofcharge
      });
}
