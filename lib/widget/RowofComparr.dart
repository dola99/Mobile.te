import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobility/providers/products.dart';
import 'package:provider/provider.dart';

class RowofCompare extends StatefulWidget {
  final String icon;
  final String name;
  final String firsttext;
  final String secondText;
  RowofCompare({this.icon, this.name, this.firsttext, this.secondText});
  @override
  _RowofCompareState createState() => _RowofCompareState();
}

class _RowofCompareState extends State<RowofCompare> {
  @override
  Widget build(BuildContext context) {
    final weig = MediaQuery.of(context).size.width;
    final hig = MediaQuery.of(context).size.height;
    return Consumer<Products>(
      builder: (context, product, child) => Padding(
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
                        style: TextStyle(
                            color: Theme.of(context).dividerColor,
                            fontFamily: 'Oswald',
                            height: 1.4),
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
                              color: Theme.of(context).backgroundColor,
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
              color: Theme.of(context).backgroundColor,
            ),
            Flexible(
                flex: 3,
                child: Container(
                  width: weig * .370,
                  child: Center(
                    child: Text(
                      widget.secondText,
                      style: TextStyle(
                          color: Theme.of(context).dividerColor,
                          fontFamily: 'Oswald',
                          height: 1.4),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
