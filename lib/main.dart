import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility/providers/Theme.dart';
import 'package:mobility/providers/ThemeChanger.dart';
import 'package:mobility/screens/MobileCategoryScreen.dart';
import 'package:mobility/widget/open_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './providers/Gamers.dart';
import './providers/tablets.dart';
import './providers/watches.dart';
import './screens/tabs-screens.dart';
import './providers/categorys.dart';
import 'providers/newphoness.dart';
import './providers/topbanners.dart';
import './providers/products.dart';
import './screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import './screens/category_screen.dart';
import './screens/compare_screen.dart';
import 'screens/setting_screen.dart';
import './screens/gamer_models_screen.dart';
import './screens/watches_screen.dart';
import './screens/Tablets_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-4854420444519405~4860028562');
  SharedPreferences.getInstance().then((prefs) {
    var darkModeON = prefs.getBool('darkMode') ?? true;
    SettingScreen.darktheme = darkModeON;
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeChanger(darkModeON ? darkTheme : lightTheme),
        child: MyApp(),
      ),
    );
  });
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
        )
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      routes: {
        TabsScreens.roouteName: (ctx) => TabsScreens(),
        HomePage.routeName: (ctx) => HomePage(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        SettingScreen.routeName: (ctx) => SettingScreen(),
        CompareScreen.routeName: (ctx) => CompareScreen(),
        MobileCategoryScreen.routeName: (ctx) => MobileCategoryScreen(),
        GamerScreen.routename: (ctx) => GamerScreen(),
        WatchesScreen.routeName: (ctx) => WatchesScreen(),
        TabletsScreen.routeName: (ctx) => TabletsScreen(),
      },
    );
  }
}
