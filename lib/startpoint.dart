import 'package:flutter/material.dart';
import 'package:mobility/matrialapp.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/compare_screen_provider.dart';
import 'package:mobility/providers/gamers.dart';
import 'package:mobility/providers/newphoness.dart';
import 'package:mobility/providers/products.dart';
import 'package:mobility/providers/tablets.dart';
import 'package:mobility/providers/topbanners.dart';
import 'package:mobility/providers/watches.dart';
import 'package:mobility/screens/setting/componets/open_apps.dart';
import 'package:provider/provider.dart';

class StartPonint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewPhoness(),
        ),
        ChangeNotifierProvider(
          create: (context) => Topbanners(),
        ),
        ChangeNotifierProvider(
          create: (context) => Categorys(),
        ),
        ChangeNotifierProvider(
          create: (context) => Gamers(),
        ),
        ChangeNotifierProvider(
          create: (context) => Watches(),
        ),
        ChangeNotifierProvider(
          create: (context) => Tablets(),
        ),
        ChangeNotifierProvider(
          create: (context) => OpenApps(),
        ),
        ChangeNotifierProvider(
          create: (context) => Compare(),
        )
      ],
      child: MaterialAppWithTheme(),
    );
  }
}
