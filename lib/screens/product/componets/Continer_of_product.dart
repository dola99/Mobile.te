import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Containerofproduct extends StatelessWidget {
  final String picture;
  final String name;
  final String text1;
  Containerofproduct({
    this.name,
    this.text1,
    this.picture,
  });
  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: wight * .95,
          height: hight * .13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  width: wight * .240,
                  height: hight * .0950,
                  child: Column(
                    children: [
                      Container(
                        height: hight * .070,
                        width: wight * .08,
                        child: SvgPicture.asset(
                          picture,
                          fit: BoxFit.contain,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Theme.of(context).dividerColor,
                                fontFamily: 'Oswald',
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                color: Theme.of(context).dividerColor,
                indent: hight * .025,
                endIndent: hight * .025,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 2,
                  top: 5,
                ),
                child: Container(
                  width: wight * .61,
                  height: hight * .110,
                  child: Wrap(
                    children: [
                      Text(
                        text1,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Theme.of(context).dividerColor,
                            height: 1.2,
                            fontFamily: "Oswald",
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
