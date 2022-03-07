import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: const Color(0Xff00040E),
  dividerColor: Colors.white,
  backgroundColor: const Color.fromRGBO(255, 189, 89, 1),
  bottomAppBarColor: const Color.fromRGBO(255, 189, 89, 1),
  hintColor: Colors.grey[300],
  focusColor: Colors.grey[500],
  disabledColor: Colors.white,
  buttonColor: Colors.grey[500],
  hoverColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color.fromRGBO(255, 189, 89, 1),
  ),
);

final lightTheme = ThemeData(
  primaryColor: const Color(0xffFFFFFF),
  dividerColor: const Color.fromRGBO(0, 4, 14, 1),
  brightness: Brightness.light,
  focusColor: Colors.black,
  buttonColor: Colors.grey[500],
  disabledColor: Colors.white,
  cardColor: Colors.grey[300],
  backgroundColor: const Color.fromRGBO(0, 4, 14, 1),
  hintColor: const Color.fromRGBO(41, 46, 50, 100),
  bottomAppBarColor: const Color.fromRGBO(239, 48, 36, 1),
  canvasColor: Colors.white,
  hoverColor: const Color.fromRGBO(255, 189, 89, 1),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
);
