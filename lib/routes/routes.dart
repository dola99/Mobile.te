import 'package:flutter/material.dart';
import 'package:mobility/screens/brands/category_screen.dart';
import 'package:mobility/screens/brands/mobile_category_screen.dart';
import 'package:mobility/screens/compare/compare_screen.dart';
import 'package:mobility/screens/gamer/gamer_models_screen.dart';
import 'package:mobility/screens/home/home_screen.dart';
import 'package:mobility/screens/setting/setting_screen.dart';
import 'package:mobility/screens/tablets/tablets_screen.dart';
import 'package:mobility/screens/tabs_screens.dart';
import 'package:mobility/screens/watches/watches_screen.dart';
import 'package:mobility/splach_screen.dart';

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
  SplachScreen.roouteName:(ctx)=>const SplachScreen()
};
