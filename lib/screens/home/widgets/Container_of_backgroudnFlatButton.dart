import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroudnFlatButtonContainer extends StatelessWidget {
  final Offset offset;
  final LinearGradient linearGradient;
  final BorderRadius borderRadius;

  BackgroudnFlatButtonContainer(
      {this.borderRadius,
      this.linearGradient,
      this.offset = const Offset(1, 1)});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      height: ScreenUtil().setHeight(73),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, offset: offset)],
        gradient: linearGradient,
        borderRadius: borderRadius,
      ),
    );
  }
}
