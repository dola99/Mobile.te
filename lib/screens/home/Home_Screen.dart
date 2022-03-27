import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:mobility/screens/home/componets/flat_buttons.dart';
import 'package:mobility/screens/home/componets/new_phone_item.dart';
import 'package:mobility/screens/home/componets/page_view_topbanner.dart';
import 'package:mobility/screens/home/componets/search_bar.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*late BannerAd myBanner;
  @override
  void initState() {
    myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    myBanner.load();
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {    final locale = Localizations.localeOf(context);

    /* final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );*/

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(230),
                child: PageviewBanner(),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              SearchBar(),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(140),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(4),
                    right: ScreenUtil().setWidth(10),
                    left: ScreenUtil().setWidth(10),
                  ),
                  child: FlatButtons(),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(380),
                child: Center(
                  child: Text(
                   "welcome-text".i18n([locale.toString()]),
                    style: TextStyle(
                      color: Theme.of(context).dividerColor,
                      fontFamily: 'RobotoCondensed',
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(8),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(380),
                height: ScreenUtil().setHeight(530),
                child: NewPhones(),
              ),
              //   adContainer
            ],
          ),
        ),
      ),
    );
  }
}
