import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfSetting extends StatelessWidget {
  final String? text;
  final Widget? widget;
  RowOfSetting({this.text, this.widget});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(text!,
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontSize: ScreenUtil().setSp(17.0),
                  fontFamily: 'RobotoCondensed')),
        ),
        widget!
      ],
    );
  }
}
