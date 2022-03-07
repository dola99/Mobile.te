import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/newphoness.dart';
import 'package:mobility/providers/theme_changer.dart';
import 'package:mobility/providers/topbanners.dart';
import 'package:mobility/routes/routes.dart';
import 'package:provider/provider.dart';

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  //final _isInit = true;
  // var _isLoading = false;
  @override
  void initState() {
    Provider.of<Topbanners>(context, listen: false).fetchAndSetProducts();
    Provider.of<Categorys>(context, listen: false).fetchandsetProducts();
    Provider.of<NewPhoness>(context, listen: false).fetchandSetsProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeChanger>(context);
    return ScreenUtilInit(
      designSize: const Size(400, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.getTheme(),
        routes: routes,
      ),
    );
  }
}
