import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../screens/gamer_models_screen.dart';
import '../screens/watches_screen.dart';
import '../screens/Tablets_screen.dart';

class FlatButtons extends StatefulWidget {
  @override
  _FlatButtonsState createState() => _FlatButtonsState();
}

class _FlatButtonsState extends State<FlatButtons> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wights = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: height * .200,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: wights * 1,
                  height: height * .170,
                  child: Stack(
                    children: <Widget>[
                      //red dialog
                      Positioned(
                        top: 2,
                        left: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(GamerScreen.routename);
                          },
                          child: Container(
                            width: wights * .450,
                            height: height * .090,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(-1, 2))
                              ],
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(247, 12, 12, 1),
                                Color.fromRGBO(247, 12, 12, 1).withOpacity(.9),
                                Color.fromRGBO(247, 12, 12, 1).withOpacity(.8),
                                Color.fromRGBO(247, 12, 12, 1).withOpacity(.7),
                              ]),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              color: Color.fromRGBO(247, 12, 12, 1),
                            ),
                          ),
                        ),
                      ),
                      //amber dialogs
                      Positioned(
                        top: 2,
                        right: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TabletsScreen.routeName);
                          },
                          child: Container(
                            width: wights * .450,
                            height: height * .090,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(1, 2))
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(255, 189, 89, 1).withOpacity(.7),
                                Color.fromRGBO(255, 189, 89, 1).withOpacity(.8),
                                Color.fromRGBO(255, 189, 89, 1).withOpacity(.9),
                                Color.fromRGBO(255, 189, 89, 1),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      //yellow dialog
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WatchesScreen.routeName);
                          },
                          child: Container(
                            width: wights * .450,
                            height: height * .090,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(1, 2))
                              ],
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(252, 213, 5, 1).withOpacity(.7),
                                Color.fromRGBO(252, 213, 5, 1).withOpacity(.8),
                                Color.fromRGBO(252, 213, 5, 1).withOpacity(.9),
                                Color.fromRGBO(252, 213, 5, 1),
                              ]),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //blue dialoh

                      Positioned(
                        bottom: 2,
                        left: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CategoryScreen.routeName);
                          },
                          child: Container(
                            width: wights * .450,
                            height: height * .090,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(-1, 2))
                              ],
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(17, 58, 71, 1),
                                Color.fromRGBO(17, 58, 71, 1).withOpacity(.9),
                                Color.fromRGBO(17, 58, 71, 1).withOpacity(.8),
                                Color.fromRGBO(17, 58, 71, 1).withOpacity(.7),
                              ]),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //white of blue dialog
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * .023,
                        left: MediaQuery.of(context).size.width * .253,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CategoryScreen.routeName);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .080,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(0),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      //white of yellow dialog
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * .023,
                        right: MediaQuery.of(context).size.width * .253,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WatchesScreen.routeName);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .080,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(100),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      //blue top of white
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * .031,
                        left: MediaQuery.of(context).size.width * .260,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, CategoryScreen.routeName);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .077,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(0),
                              ),
                              color: Color.fromRGBO(17, 58, 71, 1),
                            ),
                          ),
                        ),
                      ),
                      //yellow of the white of yellow dialog
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * .031,
                        right: MediaQuery.of(context).size.width * .260,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WatchesScreen.routeName);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .077,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(100),
                              ),
                              color: Color.fromRGBO(252, 213, 5, 1),
                            ),
                          ),
                        ),
                      ),
                      //white of amber dialog
                      Positioned(
                        top: MediaQuery.of(context).size.width * .023,
                        right: MediaQuery.of(context).size.width * .253,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TabletsScreen.routeName);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .080,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(100),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      //top of amber white
                      Positioned(
                        top: MediaQuery.of(context).size.width * .031,
                        right: MediaQuery.of(context).size.width * .260,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TabletsScreen.routeName);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .077,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(100),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: Color.fromRGBO(255, 189, 89, 1),
                            ),
                          ),
                        ),
                      ),
                      //white of red dialog
                      Positioned(
                        top: MediaQuery.of(context).size.width * .023,
                        left: MediaQuery.of(context).size.width * .253,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(GamerScreen.routename);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .080,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .040,
                        left: MediaQuery.of(context).size.width * .060,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(GamerScreen.routename);
                          },
                          child: Text(
                            'Gamer',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'RobotoCondensed',
                                fontSize: 20,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                      //red of top white of red dialog
                      Positioned(
                        top: MediaQuery.of(context).size.width * .031,
                        left: MediaQuery.of(context).size.width * .260,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(GamerScreen.routename);
                          },
                          child: Container(
                            width: wights * .200,
                            height: height * .077,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: Color.fromRGBO(255, 13, 13, 1),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .025,
                        left: MediaQuery.of(context).size.width * .070,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(CategoryScreen.routeName);
                          },
                          child: Text(
                            'Mobiles',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'RobotoCondensed',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .025,
                        right: MediaQuery.of(context).size.width * .050,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WatchesScreen.routeName);
                          },
                          child: Text(
                            'Watches',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'RobotoCondensed',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .040,
                        right: MediaQuery.of(context).size.width * .080,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TabletsScreen.routeName);
                          },
                          child: Text(
                            'Tablets',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'RobotoCondensed',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),

                      Positioned(
                        top: MediaQuery.of(context).size.height * .035,
                        left: MediaQuery.of(context).size.width * .336,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .035,
                        left: MediaQuery.of(context).size.width * .336,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .035,
                        right: MediaQuery.of(context).size.width * .336,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .037,
                        right: MediaQuery.of(context).size.width * .322,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .055,
                        right: MediaQuery.of(context).size.width * .030,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .020,
                        right: MediaQuery.of(context).size.width * .030,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .013,
                        left: MediaQuery.of(context).size.width * .030,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .055,
                        left: MediaQuery.of(context).size.width * .030,
                        child: Container(
                          width: wights * .070,
                          height: height * .030,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                251, 248, 248, 0.4699999988079071),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .030,
                        right: MediaQuery.of(context).size.width * .360,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(WatchesScreen.routeName);
                          },
                          child: Container(
                            width: wights * .060,
                            height: height * .060,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/watch.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .010,
                        left: MediaQuery.of(context).size.width * .320,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(GamerScreen.routename);
                          },
                          child: Container(
                            width: wights * .170,
                            height: height * .130,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/gamer.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .025,
                        right: MediaQuery.of(context).size.width * .345,
                        child: GestureDetector(
                          onTap: () {
                            print('tablets');
                          },
                          child: Container(
                            width: wights * .090,
                            height: height * .060,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/tablet.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * .023,
                        left: MediaQuery.of(context).size.width * .370,
                        child: Container(
                          width: wights * .055,
                          height: height * 0.0680,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/mobil.png'),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
