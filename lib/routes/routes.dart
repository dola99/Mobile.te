import 'package:flutter/material.dart';
import '../screens/home/Home_Screen.dart';
import '../screens/brands/MobileCategoryScreen.dart';
import '../screens/tablets/Tablets_screen.dart';
import '../screens/brands/category_screen.dart';
import '../screens/compare/compare_screen.dart';
import '../screens/gamer/gamer_models_screen.dart';
import '../screens/setting/setting_screen.dart';
import '../screens/tabs-screens.dart';
import '../screens/watches/watches_screen.dart';

Map<String, WidgetBuilder> routes = {
  TabsScreens.roouteName: (ctx) => TabsScreens(),
  HomePage.routeName: (ctx) => HomePage(),
  CategoryScreen.routeName: (ctx) => CategoryScreen(),
  SettingScreen.routeName: (ctx) => SettingScreen(),
  CompareScreen.routeName: (ctx) => CompareScreen(),
  MobileCategoryScreen.routeName: (ctx) => MobileCategoryScreen(),
  GamerScreen.routename: (ctx) => GamerScreen(),
  WatchesScreen.routeName: (ctx) => WatchesScreen(),
  TabletsScreen.routeName: (ctx) => TabletsScreen(),
};
