import 'package:firebase_admob/firebase_admob.dart';
import 'package:mobility/widget/flat_buttons.dart';
import '../widget/new_phone_item.dart';
import 'package:flutter/material.dart';
import '../widget/page_view_topbanner.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_screen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd mybanner;
  BannerAd buildbannerAd() {
    return BannerAd(
      adUnitId: 'ca-app-pub-4854420444519405/4121646054',
      size: AdSize.banner,
      listener: (event) {
        mybanner..show();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-4854420444519405/4121646054');
    mybanner = buildbannerAd()..load();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final weight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: height * .320,
                child: PageviewBanner(),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Center(
              child: Text(
                "_________",
                style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(child: FlatButtons()),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .040),
              child: Text(
                "Recenty : ",
                style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                width: weight * .9,
                height: height*.75,
                child: Center(child: NewPhones())),
          ],
        ),
      ),
    );
  }
}
