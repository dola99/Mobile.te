import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'matrialapp.dart';
import 'providers/Gamers.dart';
import 'providers/categorys.dart';
import 'providers/compare_screen_provider.dart';
import 'providers/newphoness.dart';
import 'providers/products.dart';
import 'providers/tablets.dart';
import 'providers/topbanners.dart';
import 'providers/watches.dart';
import 'screens/setting/componets/open_apps.dart';

class StartPonint extends StatelessWidget {
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
