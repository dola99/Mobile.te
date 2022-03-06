import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MobileItemCategry extends StatelessWidget {
  final String? image;
  final String? companyname;
  final String? productnme;
  final String? price;

  const MobileItemCategry(
      {this.image, this.companyname, this.productnme, this.price});
  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          left: 0,
          child: Container(
            width: wight * .30,
            height: hight * .27,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 0,
          child: Container(
            width: wight * .30,
            height: hight * .26,
            child: CachedNetworkImage(
              imageUrl: image!,
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          bottom: hight * .034,
          left: wight * .02,
          right: wight * .02,
          top: hight * .274,
          child: Text(
            companyname!,
            style: TextStyle(
                // ignore: deprecated_member_use
                color: Theme.of(context).hintColor,
                fontSize: 15,
                fontFamily: 'RobotoCondensed'),
          ),
        ),
        Positioned(
          bottom: hight * .085,
          left: 0,
          top: hight * .252,
          child: Container(
            child: Text(
              "_____________",
              style:
                  TextStyle(color: Theme.of(context).focusColor, fontSize: 15),
            ),
          ),
        ),
        Positioned(
          bottom: hight * .005,
          right: wight * .05,
          top: hight * .297,
          left: wight * .02,
          child: Container(
            width: wight * .55,
            height: hight * .050,
            child: Text(
              productnme!,
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontSize: 15,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: wight * .02,
          right: wight * .090,
          top: hight * .342,
          child: Text(
            '$price E.G.P',
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor,
                fontSize: 15,
                fontFamily: 'RobotoCondensed'),
          ),
        ),
      ],
    );
  }
}
