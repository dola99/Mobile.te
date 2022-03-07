import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowofCompare extends StatefulWidget {
  final String? icon;
  final String? name;
  final String? firsttext;
  final String? secondText;
  const RowofCompare({
    this.icon,
    this.name,
    this.firsttext,
    this.secondText,
  });
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
        children: [
          Flexible(
            flex: 3,
            child: SizedBox(
              width: weig * .370,
              child: Text(
                widget.firsttext!,
                style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontSize: ScreenUtil().setSp(13),
                  fontFamily: 'Oswald',
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: hig * .025),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: weig * .10,
                      height: hig * .040,
                      child: SvgPicture.asset(
                        widget.icon!,
                        color: Theme.of(context).backgroundColor,
                        semanticsLabel: 'g',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.name!,
                      style: TextStyle(
                        color: Theme.of(context).dividerColor,
                        fontSize: 12,
                        fontFamily: 'Oswald',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).backgroundColor,
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              width: weig * .370,
              child: Text(
                widget.secondText!,
                style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontSize: ScreenUtil().setSp(13),
                  fontFamily: 'Oswald',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
