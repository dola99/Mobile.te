import 'package:flutter/material.dart';

class WhiteOfShape extends StatelessWidget {
  final BorderRadiusGeometry? borderRadiusGeometry;
  WhiteOfShape({this.borderRadiusGeometry});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wights = MediaQuery.of(context).size.width;
    return Container(
      width: wights * .200,
      height: height * .080,
      decoration: BoxDecoration(
        borderRadius: borderRadiusGeometry,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
