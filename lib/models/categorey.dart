import 'package:flutter/foundation.dart';

class Category with ChangeNotifier {
  final String id;
  final String? name;
  final String? logo;
  final String? color;
  final String? madeIn;
  final String? birthday;
  final String? rateinEgypt;
  final String? rateintheworld;

  Category({
    required this.madeIn,
    required this.birthday,
    required this.rateinEgypt,
    required this.rateintheworld,
    required this.id,
    required this.name,
    required this.logo,
    required this.color,
  });
}
