import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  final Alignment? begin;
  final Alignment? end;
  final List<Color>? colors;
  final Widget? widget;
  const BackgroundColor({this.begin, this.end, this.colors, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: begin!, end: end!, colors: colors!),
        ),
        child: widget);
  }
}
