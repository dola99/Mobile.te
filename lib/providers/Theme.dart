  
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Color(0Xff00040E),
  dividerColor: Colors.white,
  backgroundColor: Color.fromRGBO(255, 189, 89, 1),
  buttonColor: Colors.grey[500],
  accentColor: Color.fromRGBO(255, 189, 89, 1),
  bottomAppBarColor: Color.fromRGBO(255, 189,89, 1),
  textSelectionColor: Colors.grey[300],
  focusColor: Colors.grey[500],
  disabledColor: Colors.white,
  cursorColor: Colors.black
);

final lightTheme = ThemeData(
  primaryColor: Color(0xffFFFFFF),
  accentColor: Colors.black,
  dividerColor: Color.fromRGBO(0, 4, 14, 1),
  brightness: Brightness.light,
  focusColor: Colors.black,
  buttonColor: Colors.grey[500],
  disabledColor: Colors.white,
  cardColor: Colors.grey[300],
  backgroundColor: Color.fromRGBO(0, 4, 14, 1),
  textSelectionColor: Color.fromRGBO(41, 46, 50, 100),
  bottomAppBarColor: Color.fromRGBO(239, 48,36, 1),
  canvasColor: Colors.white,
  cursorColor: Color.fromRGBO(255, 189, 89, 1)
);