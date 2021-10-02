import 'package:flutter/material.dart';

class ImageOfFlatButton extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final BoxFit boxFit;
  ImageOfFlatButton(
      {this.image, this.height, this.width, this.boxFit = BoxFit.fitWidth});
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final wights = MediaQuery.of(context).size.width;
    return Container(
      width: wights * width,
      height: heights * height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: boxFit),
      ),
    );
  }
}
