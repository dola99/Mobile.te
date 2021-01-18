import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobility/screens/setting_screen.dart';
import 'package:mobility/widget/Continer_of_product.dart';

import '../widget/custom_silver_delgte.dart';

class ProductDetailScreen extends StatefulWidget {
  final String logo;
  final String namrcompany;
  final String nameProduct;
  final String price;
  final String mainimage;
  final String screendetails;
  final String ram;
  final String cpu;
  final String aduio;
  final String antutu;
  final String battery;
  final String topimges;
  final String gpu;
  final String rearcamera;
  final String os;
  final String frontcamera;
  final String memory;
  final String more;
  final String lighttopscreen;
  final String fbsPubg;
  final String fbscod;
  final String resPubg;
  final String rescode;
  final List<String> allimages;
  ProductDetailScreen(
      {this.logo,
      this.namrcompany,
      this.gpu,
      this.rearcamera,
      this.frontcamera,
      this.os,
      this.memory,
      this.nameProduct,
      this.price,
      this.battery,
      this.mainimage,
      this.allimages,
      this.screendetails,
      this.cpu,
      this.topimges,
      this.aduio,
      this.antutu,
      this.fbsPubg,
      this.fbscod,
      this.resPubg,
      this.rescode,
      this.lighttopscreen,
      this.more,
      this.ram});
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
        double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true)
      ..init(context);
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                  expandedHeight: hight * .270,
                  brandimage: widget.logo,
                  namrcompany: widget.namrcompany,
                  nameProduct: widget.nameProduct,
                  mainimage: widget.mainimage,
                  price: widget.price),
            ),
            SliverFillRemaining(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
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
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: Container(
                                      width: wight * .240,
                                      height: hight * .0950,
                                      child: Column(
                                        children: [
                                          Container(
                                              height: hight * .070,
                                              width: wight * .08,
                                              child: Icon(
                                                Icons.add_to_home_screen,
                                                size: 30,
                                                color: Theme.of(context)
                                                    .accentColor,
                                              )),
                                          Center(
                                            child: Container(
                                              child: Text(
                                                'Top Screen:',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .dividerColor,
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
                                        right: 2, top: 8, left: 9),
                                    child: Container(
                                      width: wight * .61,
                                      height: hight * .0730,
                                      child: Center(
                                          child: SettingScreen.darktheme
                                              ? Image.network(
                                                  widget.topimges)
                                              : Image.network(widget.lighttopscreen)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Containerofproduct(
                          name: 'Screen:',
                          picture: 'assets/images/screen.svg',
                          text1: widget.screendetails,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/cpu.svg',
                          name: 'Cpu:',
                          text1: widget.cpu,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/Ram.svg',
                          name: 'Ram:',
                          text1: widget.ram,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/battery.svg',
                          name: 'Battery:',
                          text1: widget.battery,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/gpu.svg',
                          name: 'Gpu:',
                          text1: widget.gpu,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/frontcamera.svg',
                          name: 'Front Camera:',
                          text1: widget.frontcamera,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/backcamera.svg',
                          name: 'Rear Camera:',
                          text1: widget.rearcamera,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/memory.svg',
                          name: 'Memory',
                          text1: widget.memory,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/system.svg',
                          name: 'System:',
                          text1: widget.os,
                        ),
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
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Container(
                                  width: wight * .240,
                                  height: hight * .0950,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: hight * .070,
                                          width: wight * .08,
                                          child: Icon(
                                            Icons.volume_up,
                                            color:
                                                Theme.of(context).accentColor,
                                          )),
                                      Center(
                                        child: Container(
                                          child: Text(
                                            'Sound:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .dividerColor,
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
                                    right: 2, top: 8, left: 9),
                                child: Container(
                                  width: wight * .61,
                                  height: hight * .0730,
                                  child: Center(
                                      child: Text(
                                    widget.aduio,
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Theme.of(context).dividerColor),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Containerofproduct(
                          picture: 'assets/images/more.svg',
                          name: 'More:',
                          text1: widget.more,
                        ),
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
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Container(
                                  width: wight * .240,
                                  height: hight * .0950,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: hight * .070,
                                          width: wight * .08,
                                          child: Image.asset(
                                            'assets/images/antutu.png',
                                          )),
                                      Center(
                                        child: Container(
                                          child: Text(
                                            'Antutu:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .dividerColor,
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
                                    right: 2, top: 8, left: 9),
                                child: Container(
                                  width: wight * .61,
                                  height: hight * .0730,
                                  child: Center(
                                      child: Text(
                                    widget.antutu,
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Theme.of(context).dividerColor),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
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
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Container(
                                  width: wight * .240,
                                  height: hight * .0950,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: hight * .070,
                                          width: wight * .08,
                                          child: SvgPicture.asset(
                                            'assets/images/pubg.svg',
                                            color:
                                                Theme.of(context).accentColor,
                                          )),
                                      Center(
                                        child: Container(
                                          child: Text(
                                            'Pubg:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .dividerColor,
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
                                    right: 2, top: 8, left: 9),
                                child: Container(
                                  width: wight * .61,
                                  height: hight * .0730,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Res : ${widget.resPubg}',
                                          style: TextStyle(
                                              fontFamily: 'Oswald',
                                              color: Theme.of(context)
                                                  .dividerColor),
                                        ),
                                        Text(
                                          'FBS : ${widget.fbsPubg}',
                                          style: TextStyle(
                                              fontFamily: 'Oswald',
                                              color: Theme.of(context)
                                                  .dividerColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Container(
                                  width: wight * .240,
                                  height: hight * .0950,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: hight * .070,
                                          width: wight * .12,
                                          child: SvgPicture.asset(
                                            'assets/images/callofduty.svg',
                                            color:
                                                Theme.of(context).accentColor,
                                          )),
                                      Center(
                                        child: Container(
                                          child: Text(
                                            'Call Of Duty:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .dividerColor,
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
                                    right: 2, top: 8, left: 9),
                                child: Container(
                                  width: wight * .61,
                                  height: hight * .0730,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Res : ${widget.rescode}',
                                          style: TextStyle(
                                              fontFamily: 'Oswald',
                                              color: Theme.of(context)
                                                  .dividerColor),
                                        ),
                                        Text(
                                          'FBS : ${widget.fbscod}',
                                          style: TextStyle(
                                              fontFamily: 'Oswald',
                                              color: Theme.of(context)
                                                  .dividerColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Containerofproduct(
                          picture: 'assets/images/price.svg',
                          name: 'Price:',
                          text1: '${widget.price}E.G.P',
                        ),
                        Container(
                          height: hight * .080,
                          child: Text(''),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
