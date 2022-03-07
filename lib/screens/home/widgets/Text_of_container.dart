import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const TextFlatButton(this.text, this.color, {this.size = 20});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'RobotoCondensed',
        fontSize: ScreenUtil().setSp(size),
        letterSpacing:
            0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}
