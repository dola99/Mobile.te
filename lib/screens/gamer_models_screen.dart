import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobility/providers/Gamers.dart';
import 'package:mobility/providers/categorey.dart';

import 'package:mobility/screens/Home_Screen.dart';
import 'package:mobility/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
//import 'dart:math';

class GamerScreen extends StatefulWidget {
  static const routename = '/Gamer_Screen';

  @override
  _GamerScreenState createState() => _GamerScreenState();
}

class _GamerScreenState extends State<GamerScreen> {
  BannerAd _bannerAd;
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
  }

  PageController pageController;
  double viewportFuncation = 0.8;
  double pageOffset = 0;
  int chose;
  var _isInit = true;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
        adUnitId: 'ca-app-pub-4854420444519405/4121646054',
        size: AdSize.banner);
    _loadBannerAd();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFuncation)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page;
            });
          });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });

      Provider.of<Gamers>(context, listen: false)
          .fetchandsetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Gamers>(context, listen: false);

    final cate = HomePage.category;
    final products = loadedproducts.items;
    final hig = MediaQuery.of(context).size.height;
    final wiq = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(hig * .2123234262925839e-17, hig * .0022),
                  end: Alignment(-5.4, 2.123234262925839e-12),
                  colors: [
                    Color.fromRGBO(198, 16, 16, 1),
                    Color.fromRGBO(0, 0, 0, 1),
                    Color.fromRGBO(198, 16, 16, 1),
                    Color.fromRGBO(0, 0, 0, 1),
                  ]),
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Positioned(
                  top: hig * .060,
                  left: wiq * .420,
                  child: Text(
                    "Gamer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Oswald'),
                  ),
                ),
          Container(
            child: PageView.builder(
              controller: pageController,
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                // double scale = max(viewportFuncation,
                //(1 - (pageOffset - index).abs()) + viewportFuncation);
                double angle = (pageOffset - index).abs();
                if (angle > 0.5) {
                  angle = 1 - angle;
                }
                return GestureDetector(
                  onTap: () {
                    chosen(cate, products[index].category);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          aduio: products[index].audio,
                          antutu: products[index].antutu,
                          allimages: [products[index].images],
                          battery: products[index].capstiybattery,
                          cpu: products[index].cpu,
                          frontcamera: products[index].frontcamera,
                          gpu: products[index].gpu,
                          mainimage: products[index].mainImages,
                          memory: products[index].space,
                          nameProduct: products[index].name,
                          os: products[index].os,
                          price: products[index].price,
                          ram: products[index].ram,
                          rearcamera: products[index].rearcamera,
                          screendetails: products[index].screen,
                          topimges: products[index].topScreen,
                          lighttopscreen: products[index].lighttopscreen,
                          logo: cate[chose].logo,
                          namrcompany: cate[chose].name,
                          fbsPubg: products[index].fbspubg,
                          more: products[index].more,
                          fbscod: products[index].fbscod,
                          resPubg: products[index].respubg,
                          rescode: products[index].rescod,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: hig * .0090,
                    width: wiq * .30,
                    padding: EdgeInsets.only(
                        top: 150, bottom: 100, left: 10, right: 20),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(.7),
                                        spreadRadius: 4,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    color: Colors.white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: hig * .02,
                                      left: wiq * .02,
                                      right: wiq * .02,
                                      child: Container(
                                        width: wiq * .40,
                                        child: Center(
                                          child: Text(
                                            products[index].category,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Oswald",
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: hig * .06,
                                      left: wiq * .02,
                                      right: wiq * .02,
                                      child: Container(
                                        width: wiq * .40,
                                        child: Center(
                                          child: Text(
                                            products[index].size,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Oswald",
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: hig * .09,
                                      right: wiq * .02,
                                      left: wiq * .02,
                                      child: Container(
                                        height: hig * .3,
                                        width: wiq * .7,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    products[index].mainImages),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: hig * .20,
                                      left: wiq * .02,
                                      right: wiq * .02,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              color: Colors.amber,
                                              width: wiq * .7,
                                              height: hig * .035,
                                              child: Center(
                                                child: Text(
                                                  products[index].name,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          "RobotoCondensed",
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: wiq * .7,
                                              child: Center(
                                                child: Text(
                                                  "${products[index].price} E.G.P",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Oswald",
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: hig * .12,
                                      left: wiq * .045,
                                      child: Container(
                                        width: wiq * .3,
                                        height: hig * .07,
                                        child: Row(
                                          children: [
                                            Container(
                                                width: wiq * .060,
                                                height: hig * .060,
                                                child: SvgPicture.asset(
                                                  'assets/images/pubg.svg',
                                                  color: Colors.black,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Pubg",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontFamily: "Oswald"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: hig * .10,
                                      left: wiq * .25,
                                      child: Container(
                                        width: wiq * .5,
                                        height: hig * .1,
                                        child: Row(
                                          children: [
                                            VerticalDivider(
                                              indent: hig * .015,
                                              endIndent: hig * .015,
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: hig * .018,
                                                ),
                                                Text(
                                                  "Res: ${products[index].respubg}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontFamily: "Oswald"),
                                                ),
                                                Text(
                                                  "FBS: ${products[index].fbspubg}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontFamily: "Oswald"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: hig * .040,
                                      left: wiq * .01,
                                      child: Container(
                                        width: wiq * .3,
                                        height: hig * .07,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: wiq * .060,
                                                    height: hig * .05,
                                                    child: SvgPicture.asset(
                                                      'assets/images/callofduty.svg',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "C.O.D ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily: "Oswald"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: hig * .01,
                                      left: wiq * .25,
                                      child: Container(
                                        width: wiq * .5,
                                        height: hig * .1,
                                        child: Row(
                                          children: [
                                            VerticalDivider(
                                              indent: hig * .010,
                                              color: Colors.grey,
                                              thickness: 1,
                                              endIndent: hig * .010,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: hig * .018,
                                                ),
                                                Text(
                                                  "Res: ${products[index].rescod}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontFamily: "Oswald"),
                                                ),
                                                Text(
                                                  "Fbs: ${products[index].fbscod}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontFamily: "Oswald"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: hig * .055,
            left: wiq * .030,
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  void chosen(List<Category> list, String string) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].name == string) {
        chose = i;
      }
    }
  }
}
