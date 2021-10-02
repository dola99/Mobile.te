import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/ThemeChanger.dart';
import 'package:mobility/providers/topbanners.dart';
import 'package:mobility/routes/routes.dart';
import 'package:provider/provider.dart';

import 'providers/categorys.dart';
import 'providers/newphoness.dart';
import 'providers/products.dart';

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  var _isInit = true;
  var isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<Products>(context, listen: false).fetchandsetProducts();
      await Provider.of<Categorys>(context, listen: false)
          .fetchandsetProducts();
      await Provider.of<Topbanners>(context, listen: false)
          .fetchAndSetProducts();
      await Provider.of<NewPhoness>(context, listen: false)
          .fetchandSetsProducts()
          .then((_) {
        setState(() {
          isLoading = true;
        });
      });
    }
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    final themeNotifier = Provider.of<ThemeChanger>(context);
    return ScreenUtilInit(
      designSize: Size(defaultScreenWidth, defaultScreenHeight),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.getTheme(),
          routes: routes),
    );
  }
}
