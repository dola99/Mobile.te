import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility/providers/Theme.dart';
import 'package:mobility/providers/ThemeChanger.dart';
import 'package:mobility/startpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'screens/setting/setting_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //FirebaseAnalytics analytics = FirebaseAnalytics();
  // FirebaseAnalyticsObserver(analytics: analytics);
  SharedPreferences.getInstance().then((prefs) {
    var darkModeON = prefs.getBool('darkMode') ?? false;
    SettingScreen.darktheme = darkModeON;
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeChanger(darkModeON ? darkTheme : lightTheme),
        child: StartPonint(),
      ),
    );
  });
}
