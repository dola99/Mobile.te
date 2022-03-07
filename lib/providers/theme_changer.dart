import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData? _themeData;
  ThemeChanger(this._themeData);
  ThemeData? getTheme() => _themeData;
  void setTheme(ThemeData? themeDate) {
    _themeData = themeDate;
    notifyListeners();
  }
}
