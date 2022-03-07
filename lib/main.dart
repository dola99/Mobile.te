import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobility/providers/theme.dart';
import 'package:mobility/providers/theme_changer.dart';
import 'package:mobility/screens/setting/setting_screen.dart';
import 'package:mobility/startpoint.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  if (kDebugMode) {
    FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(false); //disable false
  } else {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  MobileAds.instance.initialize();
  //FirebaseAnalytics analytics = FirebaseAnalytics();
  // FirebaseAnalyticsObserver(analytics: analytics);
  SharedPreferences.getInstance().then((prefs) {
    final darkModeON = prefs.getBool('darkMode') ?? false;
    SettingScreen.darktheme = darkModeON;
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeChanger(darkModeON ? darkTheme : lightTheme),
        child: StartPonint(),
      ),
    );
  });
}
