import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobility/providers/theme.dart';
import 'package:mobility/providers/theme_changer.dart';
import 'package:mobility/screens/setting/componets/open_apps.dart';
import 'package:mobility/screens/setting/componets/row_of_settingpage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SettingScreen extends StatefulWidget {
  static late bool darktheme;
  static bool isswitch = true;
  static const routeName = "/setting_screen";

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _darkTheme = false;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeChanger>(context, listen: false);
    _darkTheme = themeNotifier.getTheme() == darkTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(40.0),
                  bottom: ScreenUtil().setWidth(5.0),
                ),
                child: SafeArea(
                  child: Container(
                    width: ScreenUtil().setWidth(250),
                    height: ScreenUtil().setHeight(200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: _darkTheme
                            ? const AssetImage("assets/images/logo.png")
                            : const AssetImage("assets/images/logo2.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: RowOfSetting(
                text: "Language:",
                widget: Text(
                  "Arabic",
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    fontSize: ScreenUtil().setSp(17.0),
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              indent: MediaQuery.of(context).size.width * .30,
              endIndent: MediaQuery.of(context).size.width * .30,
            ),
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: RowOfSetting(
                text: "Country:",
                widget: Text(
                  "Egypt",
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    fontSize: ScreenUtil().setSp(17.0),
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              indent: MediaQuery.of(context).size.width * .30,
              endIndent: MediaQuery.of(context).size.width * .30,
            ),
            SizedBox(
              width: 270.w,
              height: 50.h,
              child: RowOfSetting(
                text: "Dark Mode:",
                widget: Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setSp(110)),
                  child: Switch(
                    value: _darkTheme,
                    onChanged: (value) {
                      setState(() {
                        _darkTheme = value;
                        SettingScreen.darktheme = value;
                        //  }
                      });
                      onThemeChanged(themeNotifier, value: value);
                    },
                    activeTrackColor: Colors.lightBlueAccent,
                    activeColor: Colors.blue,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              indent: MediaQuery.of(context).size.width * .30,
              endIndent: MediaQuery.of(context).size.width * .30,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Follow Us",
              style: TextStyle(
                color: Theme.of(context).dividerColor,
                fontSize: 17,
                fontFamily: "Oswald",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(110),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(
                          140,
                          148,
                          169,
                          0.2384793907403946,
                        ),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(25),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<OpenApps>(context, listen: false)
                          .launchSocial('fb://page/109013927681503', '');
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().setWidth(65),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromRGBO(238, 238, 255, 1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(32),
                  left: ScreenUtil().setWidth(42),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<OpenApps>(context, listen: false)
                          .launchSocial('fb://page/109013927681503', '');
                    },
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .07,
                        height: MediaQuery.of(context).size.height * .045,
                        child: SvgPicture.asset(
                          'assets/images/face.svg',
                          semanticsLabel: 'f',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(118),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<OpenApps>(context, listen: false)
                          .launchSocial(
                        'https://www.instagram.com/mobile.te.eg/',
                        '',
                      );
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().setWidth(65),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromRGBO(255, 215, 223, 1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(32),
                  left: ScreenUtil().setWidth(137),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<OpenApps>(context, listen: false)
                          .launchSocial(
                        'https://www.instagram.com/mobile.te.eg/',
                        '',
                      );
                    },
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .07,
                        height: MediaQuery.of(context).size.height * .045,
                        child: SvgPicture.asset(
                          'assets/images/insta.svg',
                          semanticsLabel: 'insta',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(20),
                  right: ScreenUtil().setWidth(25),
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(65),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromRGBO(255, 238, 238, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .044,
                  bottom: MediaQuery.of(context).size.height * .056,
                  right: MediaQuery.of(context).size.width * .09,
                  left: MediaQuery.of(context).size.width * .55,
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<OpenApps>(context, listen: false)
                          .launchSocial(
                        'https://www.youtube.com/channel/UC1uP9aUxEGRdDL1lwzuJQLg',
                        '',
                      );
                    },
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .09,
                        height: MediaQuery.of(context).size.height * .045,
                        child: SvgPicture.asset(
                          'assets/images/youtube.svg',
                          semanticsLabel: 'pin',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> onThemeChanged(
    ThemeChanger themeNotifier, {
    required bool value,
  }) async {
    value
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
