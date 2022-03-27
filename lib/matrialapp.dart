import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/newphoness.dart';
import 'package:mobility/providers/theme_changer.dart';
import 'package:mobility/providers/topbanners.dart';
import 'package:mobility/routes/routes.dart';
import 'package:provider/provider.dart';

class MaterialAppWithTheme extends StatefulWidget {
  @override
  MaterialAppWithThemeState createState() => MaterialAppWithThemeState();
}

class MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  //final _isInit = true;
  // var _isLoading = false;
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    Provider.of<Topbanners>(context, listen: false).fetchAndSetProducts();
    Provider.of<Categorys>(context, listen: false).fetchandsetProducts();
    Provider.of<NewPhoness>(context, listen: false).fetchandSetsProducts();
  }

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['i18n'];

    final themeNotifier = Provider.of<ThemeChanger>(context);
    return ScreenUtilInit(
      designSize: const Size(400, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        locale: _locale,
        localeResolutionCallback: (locale, supportedLocales) {
          if (supportedLocales.contains(locale)) {
            return locale;
          }
          if (locale?.languageCode == 'en') {
            return const Locale('en');
          }
          return const Locale(
            'en',
          );
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          LocalJsonLocalization.delegate
        ],
        supportedLocales: const [
          Locale(
            'en',
          ),
          Locale(
            'ar',
          ),
          Locale('es'),
          Locale('fr'),
          Locale('de'),
          Locale('hi')
        ],
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.getTheme(),
        routes: routes,
      ),
    );
  }
}
