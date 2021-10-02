import 'package:flutter/foundation.dart';

class Gamer with ChangeNotifier {
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
  final String lighttopscreen;
  final String speedofcharge;
  final String category;
  final String images;
  final String mainImages;
  final String audio;
  final String antutu;
  final String fbspubg;
  final String respubg;
  final String fbscod;
  final String rescod;
  final String more;
  final String price;
  final String jumiabuy;
  final String noonbuy;
  final String souqbuy;
  Gamer({
    @required this.jumiabuy,
    @required this.noonbuy,
    @required this.souqbuy,
    @required this.price,
    @required this.mainImages,
    @required this.images,
    @required this.name,
    @required this.id,
    @required this.category,
    @required this.antutu,
    @required this.audio,
    @required this.cpu,
    @required this.gpu,
    @required this.more,
    @required this.ram,
    @required this.frontcamera,
    @required this.rearcamera,
    @required this.screen,
    @required this.os,
    @required this.capstiybattery,
    @required this.size,
    @required this.space,
    @required this.topScreen,
    @required this.speedofcharge,
    @required this.fbscod,
    @required this.fbspubg,
    @required this.rescod,
    @required this.respubg,
    @required this.lighttopscreen,
  });
}
