import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerOfGamer extends StatelessWidget {
  final double? angle;
  final String? category;
  final String? size;
  final String? mainImage;
  final String? name;
  final String? price;
  final String? respubg;
  final String? fbspubg;
  final String? rescod;
  final String? fbscod;
  ContainerOfGamer(
      {this.angle,
      this.category,
      this.size,
      this.mainImage,
      this.name,
      this.price,
      this.respubg,
      this.fbspubg,
      this.rescod,
      this.fbscod});
  @override
  Widget build(BuildContext context) {
    final hig = MediaQuery.of(context).size.height;
    final wiq = MediaQuery.of(context).size.width;

    return Container(
      height: hig * .0090,
      width: wiq * .30,
      padding: EdgeInsets.only(top: 150, bottom: 100, left: 10, right: 20),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle!),
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
                          color: Theme.of(context).accentColor.withOpacity(.7),
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
                              category!,
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
                              size!,
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
                                  image: NetworkImage(mainImage!),
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
                                    name!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "RobotoCondensed",
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                width: wiq * .7,
                                child: Center(
                                  child: Text(
                                    "$price E.G.P",
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
                                padding: const EdgeInsets.all(8.0),
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
                                    "Res: $respubg",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: "Oswald"),
                                  ),
                                  Text(
                                    "FBS: $fbspubg",
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
                                    padding: const EdgeInsets.all(8.0),
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
                                    "Res: $rescod",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: "Oswald"),
                                  ),
                                  Text(
                                    "Fbs: $fbscod",
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
    );
  }
}
