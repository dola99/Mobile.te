import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../widget/open_apps.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = "/setting_screen";

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final bool isswitch = true;

  @override
  Widget build(BuildContext context) {
  //  final high = MediaQuery.of(context).size.height;
  //  final wigh = MediaQuery.of(context).size.width;
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true)
      ..init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil.instance.setHeight(40.0),
                    bottom: ScreenUtil.instance.setWidth(5.0)),
                child: SafeArea(
                  child: Container(
                    width: ScreenUtil.instance.setWidth(250),
                    height: ScreenUtil.instance.setHeight(200),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        )),
                  ),
                ),
              ),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(450),
              width: ScreenUtil.instance.setWidth(500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil.instance.setWidth(9)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(55)),
                          child: Text(
                            "Language:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil.instance.setSp(17.0),
                                fontFamily: 'RobotoCondensed'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(100)),
                          child: Text(
                            "English(Us)",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(17.0),
                                fontFamily: 'RobotoCondensed'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: MediaQuery.of(context).size.width * .30,
                    endIndent: MediaQuery.of(context).size.width * .30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil.instance.setWidth(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(48)),
                          child: Text(
                            "Country:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil.instance.setSp(17.0),
                                fontFamily: 'RobotoCondensed'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(140)),
                          child: Text(
                            "Egypt",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(17.0),
                                fontFamily: 'RobotoCondensed'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: MediaQuery.of(context).size.width * .30,
                    endIndent: MediaQuery.of(context).size.width * .30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(5),
                        bottom: ScreenUtil.instance.setHeight(5),
                        right: ScreenUtil.instance.setWidth(18),
                        left: ScreenUtil.instance.setWidth(23)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(40),
                              top: ScreenUtil.instance.setHeight(13)),
                          child: Text(
                            "Dark Mode:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil.instance.setSp(17.0),
                                fontFamily: 'RobotoCondensed'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setSp(110)),
                          child: Switch(
                            value: isswitch,
                            onChanged: (value) {
                              setState(() {
                                // ignore: unnecessary_statements
                                isswitch == value;
                                print(isswitch);
                              });
                            },
                            activeTrackColor: Colors.lightBlueAccent,
                            activeColor: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: MediaQuery.of(context).size.width * .30,
                    endIndent: MediaQuery.of(context).size.width * .30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Share",
                    style: TextStyle(color: Colors.white, fontFamily: "Oswald"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: ScreenUtil.instance.setWidth(300),
                        height: ScreenUtil.instance.setHeight(110),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      140, 148, 169, 0.2384793907403946),
                                  offset: Offset(0, 4),
                                  blurRadius: 20)
                            ]),
                      ),
                      Positioned(
                        top: ScreenUtil.instance.setHeight(20),
                        left: ScreenUtil.instance.setWidth(25),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<OpenApps>(context, listen: false)
                                .launchSocial('fb://page/109013927681503', '');
                          },
                          child: Container(
                            height: ScreenUtil.instance.setHeight(60),
                            width: ScreenUtil.instance.setWidth(65),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Color.fromRGBO(238, 238, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil.instance.setHeight(35),
                        left: ScreenUtil.instance.setWidth(50),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<OpenApps>(context, listen: false)
                                .launchSocial('fb://page/109013927681503', '');
                          },
                          child: SvgPicture.asset(
                            'assets/images/face.svg',
                            semanticsLabel: 'f',
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil.instance.setHeight(20),
                        left: ScreenUtil.instance.setWidth(118),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<OpenApps>(context, listen: false)
                                .launchSocial(
                                    'https://www.instagram.com/mobile.te.eg/',
                                    '');
                          },
                          child: Container(
                            height: ScreenUtil.instance.setHeight(60),
                            width: ScreenUtil.instance.setWidth(65),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Color.fromRGBO(255, 215, 223, 1),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil.instance.setHeight(36),
                        left: ScreenUtil.instance.setWidth(136),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<OpenApps>(context, listen: false)
                                .launchSocial(
                                    'https://www.instagram.com/mobile.te.eg/',
                                    '');
                          },
                          child: SvgPicture.asset(
                            'assets/images/insta.svg',
                            semanticsLabel: 'insta',
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil.instance.setHeight(20),
                        right: ScreenUtil.instance.setWidth(25),
                        child: Container(
                          height: ScreenUtil.instance.setHeight(60),
                          width: ScreenUtil.instance.setWidth(65),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(255, 238, 238, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil.instance.setHeight(35),
                        right: ScreenUtil.instance.setWidth(45),
                        child: SvgPicture.asset(
                          'assets/images/pin.svg',
                          semanticsLabel: 'pin',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
