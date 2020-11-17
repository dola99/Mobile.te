import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowofCompare extends StatefulWidget {
  final String icon;
  final String name;
  final String firsttext;
  final String secondText;
  RowofCompare({this.icon,this.name,this.firsttext,this.secondText});
  @override
  _RowofCompareState createState() => _RowofCompareState();
}

class _RowofCompareState extends State<RowofCompare> {
  @override
  Widget build(BuildContext context) {
    final weig = MediaQuery.of(context).size.width;
    final hig = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: weig * .025),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              flex: 3,
              child: Container(
                  width: weig * .370,
                  child: Center(
                    child: Text(
                      widget.firsttext,
                      style: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
                    ),
                  ))),
          VerticalDivider(
            color: Theme.of(context).accentColor,
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: hig * .025),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: weig * .10,
                          height: hig * .040,
                          child: SvgPicture.asset(
                            widget.icon,
                            semanticsLabel: 'g',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: 'Oswald'),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          VerticalDivider(
            color: Theme.of(context).accentColor,
          ),
          Flexible(
              flex: 3,
              child: Container(
                width: weig * .250,
                child: Center(
                  child: Text(
                    widget.secondText,
                    style: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
