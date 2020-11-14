import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class NewPhones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final weight = MediaQuery.of(context).size.height;
    return Container(
      width: weight * .190,
      height: hight * .200,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: hight * .0450,
            left: weight * .01,
            child: Container(
              width: weight * .16,
              height: hight * .07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            bottom: hight * .0680,
            left: weight * .0350,
            child: Text(
              'Huwaei',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          Positioned(
            top: hight * .0150,
            left: weight * .0250,
            child: Container(
              width: weight * .070,
              height: hight * .060,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Kindpng_199621511.png'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Positioned(
            bottom: hight * .0250,
            right: weight * .0150,
            child: Transform.rotate(
              angle: (math.pi / 180),
              child: Container(
                width: weight * .065,
                height: hight * .180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.ibb.co/yhQ5GyC/huawei-y9a-8gb-128gb-space-silver-2-1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: hight * .003,
            left: weight * .050,
            child: Text(
              "P 40 Pro ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'RobotoCondensed',
              ),
            ),
          )
        ],
      ),
    );
  }
}
