import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility/widget/open_apps.dart';
import './providers/Gamers.dart';
import './providers/tablets.dart';
import './providers/watches.dart';
import './screens/tabs-screens.dart';
import './providers/categorys.dart';
import './providers/newphones.dart';
import './providers/topbanners.dart';
import './providers/products.dart';
import './screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import './screens/category_screen.dart';
import './screens/compare_screen.dart';
import 'screens/setting_screen.dart';
import './screens/MobileCategoryScreen.dart';
import './screens/gamer_models_screen.dart';
import './screens/watches_screen.dart';
import './screens/Tablets_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewPhones(),
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(0, 4, 0, 1),
          accentColor: const Color.fromRGBO(255, 189, 89, 1),
        ),
        routes: {
          TabsScreens.roouteName: (ctx) => TabsScreens(),
          // TabScrenn.roouteName: (ctx) => TabScrenn(),
          HomePage.routeName: (ctx) => HomePage(),
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
          SettingScreen.routeName: (ctx) => SettingScreen(),
          CompareScreen.routeName: (ctx) => CompareScreen(),
          MobileCategoryScreen.routeName: (ctx) => MobileCategoryScreen(),
          GamerScreen.routename: (ctx) => GamerScreen(),
          WatchesScreen.routeName: (ctx) => WatchesScreen(),
          TabletsScreen.routeName: (ctx) => TabletsScreen(),
        },
      ),
    );
  }
}
