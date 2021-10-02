import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobility/providers/compare_screen_provider.dart';

import 'package:mobility/screens/setting/setting_screen.dart';
import 'package:mobility/screens/compare/widgets/Center_Compare.dart';
import 'package:mobility/screens/compare/widgets/RowofComparr.dart';
import '../../widget/dialog_search.dart';
import 'package:provider/provider.dart';

class CompareScreen extends StatefulWidget {
  static const routeName = "/Compare_screen";

  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  @override
  Widget build(BuildContext context) {
    var product1 = Provider.of<Compare>(context).product1 ?? null;
    var product2 = Provider.of<Compare>(context).product2 ?? null;
    final weig = MediaQuery.of(context).size.width;
    final high = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Text(
                    "Compare",
                    style: TextStyle(
                        color: Theme.of(context).dividerColor,
                        fontFamily: "Oswald",
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: double.infinity,
                    height: high * .40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        product1 == null
                            ? Container(
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return DialogSearch();
                                            });
                                      });
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/compare.svg')),
                              )
                            : Container(
                                width: weig * .4,
                                height: high * .4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: high * .040,
                                      child: IconButton(
                                        icon: Icon(Icons.close,
                                            color:
                                                Theme.of(context).accentColor),
                                        onPressed: () {
                                          Provider.of<Compare>(context,
                                                  listen: false)
                                              .removeproduct(1);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: high * .03,
                                    ),
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, -0.4)
                                        ..rotateY(.003),
                                      child: Container(
                                        height: high * .25,
                                        width: weig * .3,
                                        child: Image.network(
                                          product1.mainImages,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, -.06)
                                        ..rotateY(0.005),
                                      child: Container(
                                        width: weig * .40,
                                        height: high * .06,
                                        child: Center(
                                          child: Text(
                                            product1.name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                fontFamily: 'Oswald',
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        CenterCompare(),
                        product2 == null
                            ? Container(
                                child: GestureDetector(
                                    onTap: () {
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return DialogSearch();
                                          });
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/compare.svg')))
                            : Container(
                                width: weig * .4,
                                height: high * .4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: high * .040,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Provider.of<Compare>(context,
                                                    listen: false)
                                                .removeproduct(2);
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: high * .03,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DialogSearch();
                                              });
                                        });
                                      },
                                      child: Transform(
                                        transform: Matrix4.identity()
                                          ..setEntry(3, 2, .006)
                                          ..rotateY(.09),
                                        child: Container(
                                          height: high * .25,
                                          width: weig * .3,
                                          child: Image.network(
                                            product2.mainImages,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, .06)
                                        ..rotateY(0.005),
                                      child: Container(
                                        width: weig * .40,
                                        height: high * .06,
                                        child: Center(
                                          child: Text(
                                            product2.name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                fontFamily: 'Oswald',
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  indent: 100,
                  color: Theme.of(context).backgroundColor,
                  endIndent: 100,
                ),
                Container(
                    width: double.infinity,
                    height: high * .17,
                    child: Padding(
                      padding: EdgeInsets.only(left: weig * .025),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              width: weig * .370,
                              child: Center(
                                  child: (product1 == null)
                                      ? Text('')
                                      : SettingScreen.darktheme
                                          ? Image.network(product1.topScreen)
                                          : Image.network(
                                              product1.lightTopScreen)),
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).accentColor,
                          ),
                          Flexible(
                              flex: 1,
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(top: high * .025),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: weig * .10,
                                            height: high * .040,
                                            child: Icon(
                                              Icons.add_to_home_screen,
                                              size: 30,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Top Screen',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .dividerColor,
                                              fontSize: 12,
                                              height: 1.2,
                                              fontFamily: 'Oswald'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          VerticalDivider(
                            color: Theme.of(context).backgroundColor,
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              width: weig * .370,
                              child: Center(
                                child: (product2 == null)
                                    ? Text('')
                                    : SettingScreen.darktheme
                                        ? Image.network(product2.topScreen)
                                        : Image.network(
                                            product2.lightTopScreen),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .26,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.screen,
                    secondText: (product2 == null) ? '' : product2.screen,
                    icon: 'assets/images/screen.svg',
                    name: 'Screen',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .23,
                  child: RowofCompare(
                    firsttext: (product1 != null) ? product1.cpu : '',
                    secondText: (product2 != null) ? product2.cpu : '',
                    icon: 'assets/images/cpu.svg',
                    name: 'Cpu',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .15,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.ram,
                    secondText: (product2 == null) ? '' : product2.ram,
                    icon: 'assets/images/Ram.svg',
                    name: 'Ram',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .15,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.gpu,
                    secondText: (product2 == null) ? '' : product2.gpu,
                    icon: 'assets/images/gpu.svg',
                    name: 'Gpu',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .17,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.frontcamera,
                    secondText: (product2 == null) ? '' : product2.frontcamera,
                    icon: 'assets/images/frontcamera.svg',
                    name: 'Front Camera',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .26,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.rearcamera,
                    secondText: (product2 == null) ? '' : product2.rearcamera,
                    icon: 'assets/images/backcamera.svg',
                    name: 'Back Camera',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .15,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.space,
                    secondText: (product2 == null) ? '' : product2.space,
                    icon: 'assets/images/memory.svg',
                    name: 'Memory',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .15,
                  child: RowofCompare(
                    firsttext:
                        (product1 == null) ? '' : product1.capstiybattery,
                    secondText:
                        (product2 == null) ? '' : product2.capstiybattery,
                    icon: 'assets/images/battery.svg',
                    name: 'Battery',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .15,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.os,
                    secondText: (product2 == null) ? '' : product2.os,
                    icon: 'assets/images/system.svg',
                    name: 'System',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .17,
                  child: Padding(
                    padding: EdgeInsets.only(left: weig * .025),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            width: weig * .370,
                            child: Center(
                                child: (product1 == null)
                                    ? Text('')
                                    : Text(
                                        product1.aduio,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).dividerColor,
                                            fontFamily: 'Oswald',
                                            height: 1.4),
                                      )),
                          ),
                        ),
                        VerticalDivider(
                          color: Theme.of(context).accentColor,
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: high * .025),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: weig * .10,
                                          height: high * .040,
                                          child: Icon(
                                            Icons.volume_up,
                                            size: 30,
                                            color:
                                                Theme.of(context).accentColor,
                                          )),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Audio',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            height: 1.2,
                                            fontFamily: 'Oswald'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        VerticalDivider(
                          color: Theme.of(context).backgroundColor,
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            width: weig * .370,
                            child: Center(
                              child: (product2 == null)
                                  ? Text('')
                                  : Text(
                                      product2.aduio,
                                      style: TextStyle(
                                          color: Theme.of(context).dividerColor,
                                          fontFamily: 'Oswald',
                                          height: 1.4),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .17,
                  child: Padding(
                    padding: EdgeInsets.only(left: weig * .025),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            width: weig * .370,
                            child: Center(
                                child: (product1 == null)
                                    ? Text('')
                                    : Text(
                                        product1.antutue,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).dividerColor,
                                            fontFamily: 'Oswald',
                                            height: 1.4),
                                      )),
                          ),
                        ),
                        VerticalDivider(
                          color: Theme.of(context).accentColor,
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: high * .025),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: weig * .10,
                                        height: high * .040,
                                        child: Image.asset(
                                            'assets/images/antutu.png'),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Antutu',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            height: 1.2,
                                            fontFamily: 'Oswald'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        VerticalDivider(
                          color: Theme.of(context).backgroundColor,
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            width: weig * .370,
                            child: Center(
                              child: (product2 == null)
                                  ? Text('')
                                  : Text(
                                      product2.antutue,
                                      style: TextStyle(
                                          color: Theme.of(context).dividerColor,
                                          fontFamily: 'Oswald',
                                          height: 1.4),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .23,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.more,
                    secondText: (product2 == null) ? '' : product2.more,
                    icon: 'assets/images/more.svg',
                    name: 'More',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                    width: double.infinity,
                    height: high * .17,
                    child: Padding(
                      padding: EdgeInsets.only(left: weig * .025),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              width: weig * .360,
                              child: Center(
                                child: Text(
                                  (product1 == null)
                                      ? ''
                                      : '''
                                    RP:  ${product1.respubg}
                                    FP:  ${product1.respubg}
                                    RC:  ${product1.rescod}
                                    FC:  ${product1.rescod}''',
                                  style: TextStyle(
                                      color: Theme.of(context).dividerColor,
                                      height: 1.3,
                                      fontFamily: 'Oswald',
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).accentColor,
                          ),
                          Flexible(
                              flex: 1,
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(top: high * .025),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: weig * .10,
                                          height: high * .040,
                                          child: SvgPicture.asset(
                                            'assets/images/gaming.svg',
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            semanticsLabel: 'g',
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Gaming',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: 'Oswald'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          VerticalDivider(
                            color: Theme.of(context).backgroundColor,
                          ),
                          Flexible(
                              flex: 3,
                              child: Container(
                                width: weig * .360,
                                child: Center(
                                  child: Text(
                                    (product2 == null)
                                        ? ''
                                        : '''
                                    RP:  ${product2.respubg}
                                    FP:  ${product2.respubg}
                                    RC:  ${product2.rescod}
                                    FC:  ${product2.rescod}''',
                                    style: TextStyle(
                                        color: Theme.of(context).dividerColor,
                                        height: 1.3,
                                        fontFamily: 'Oswald',
                                        fontSize: 11),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
                Container(
                  width: double.infinity,
                  height: high * .15,
                  child: RowofCompare(
                    firsttext: (product1 == null) ? '' : product1.price,
                    secondText: (product2 == null) ? '' : product2.price,
                    icon: 'assets/images/price.svg',
                    name: 'Price',
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: weig * .20,
                  endIndent: weig * .20,
                ),
              ],
            ),
          ),
        ));
  }
}
