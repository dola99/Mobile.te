import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerOfNewItem extends StatelessWidget {
  final String? logo;
  final String? image;
  final String? text;

  const ContainerOfNewItem({this.logo, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(defaultScreenWidth, defaultScreenHeight),
        orientation: Orientation.portrait);
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: ScreenUtil().setHeight(55),
            left: ScreenUtil().setWidth(3),
            child: Container(
              width: ScreenUtil().setWidth(120),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(60),
            left: ScreenUtil().setWidth(45),
            child: Text(
              'New',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Oswald',
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(20),
            left: ScreenUtil().setWidth(8),
            child: Container(
              width: ScreenUtil().setWidth(90),
              height: ScreenUtil().setHeight(70),
              child: CachedNetworkImage(
                imageUrl: logo!,
                fit: BoxFit.contain,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(0),
            right: ScreenUtil().setWidth(3),
            child: Container(
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(160),
              child: CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(7),
            left: ScreenUtil().setWidth(3),
            child: Container(
              height: ScreenUtil().setHeight(45),
              width: ScreenUtil().setWidth(105),
              child: Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  text!,
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    fontSize: ScreenUtil().setSp(16),
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
