import 'package:flutter/material.dart';
import 'package:mobility/providers/Gamers.dart';
import 'package:provider/provider.dart';
//import 'dart:math';

class GamerScreen extends StatefulWidget {
  static const routename = '/Gamer_Screen';

  @override
  _GamerScreenState createState() => _GamerScreenState();
}

class _GamerScreenState extends State<GamerScreen> {
  PageController pageController;
  double viewportFuncation = 0.8;
  double pageOffset = 0;
  var _isInit = true;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFuncation)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page;
            });
          });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Gamers>(context).fetchandsetProducts().then((_) {
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
    final loadedproducts = Provider.of<Gamers>(context);
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
                  begin: Alignment(2.123234262925839e-17, 2),
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
                return Container(
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
                                    left: wiq * .250,
                                    child: Text(
                                      products[index].category,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Oswald",
                                          fontSize: 20),
                                    ),
                                  ),
                                  Positioned(
                                    top: hig * .09,
                                    right: wiq * .01,
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
                                    left: wiq * .250,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            products[index].name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "RobotoCondensed",
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "${products[index].price} E.G.P",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Oswald",
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: hig * .125,
                                    left: wiq * .07,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Pubg :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: "Oswald"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: hig * .05,
                                    left: wiq * .05,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "FBS:${products[index].fbspubg}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Oswald"),
                                          ),
                                          Text(
                                            "RES:${products[index].respubg}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Oswald"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: hig * .125,
                                    right: wiq * .07,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "C.O.D :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: "Oswald"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: hig * .05,
                                    right: wiq * .05,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "FBS:${products[index].fbscod}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Oswald"),
                                          ),
                                          Text(
                                            "RES:${products[index].rescod}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Oswald"),
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
}
