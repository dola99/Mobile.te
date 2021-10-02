import 'package:flutter/material.dart';
import 'dart:math' as math;

class CenterCompare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .08,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .010,
            height: MediaQuery.of(context).size.height * .15,
            color: Theme.of(context).accentColor,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .090,
            height: MediaQuery.of(context).size.height * .04,
            child: Text(
              "Vs",
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontFamily: 'Oswald',
                  fontSize: 22),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .010,
            height: MediaQuery.of(context).size.height * .15,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
