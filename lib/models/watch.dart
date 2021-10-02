import 'package:flutter/foundation.dart';

class Watch with ChangeNotifier {
  final String id;
  final String name;
  final String brand;
  final String screensize;
  final String type;
  final String weight;
  final String dimensios;
  final String memory;
  final String screentype;
  final String battery;
  final String colors;
  final String price;
  final String mainIages;
  final String images;
  final String waterproof;
  final String blutoothversion;
  final String warranty;
  final String comatabilty;
  final String os;
  final String prototype;
  final String alwayswork;
  final String buynoon;
  final String buyjumia;
  final String buysouq;
  Watch(
      {@required this.buynoon,
      @required this.buyjumia,
      @required this.buysouq,
      @required this.prototype,
      @required this.os,
      @required this.alwayswork,
      @required this.id,
      @required this.type,
      @required this.waterproof,
      @required this.blutoothversion,
      @required this.warranty,
      @required this.comatabilty,
      @required this.name,
      @required this.brand,
      @required this.screensize,
      @required this.weight,
      @required this.dimensios,
      @required this.memory,
      @required this.screentype,
      @required this.battery,
      @required this.colors,
      @required this.price,
      @required this.mainIages,
      @required this.images});
}
