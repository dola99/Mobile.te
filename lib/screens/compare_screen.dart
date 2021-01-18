
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobility/screens/setting_screen.dart';
import 'package:mobility/widget/RowofComparr.dart';
import '../widget/dialog_search.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class CompareScreen extends StatefulWidget {
  static const routeName = "/Compare_screen";

  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  var _isInit = true;
  var isLoading = false;

  @override
  // ignore: must_call_super
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context, listen: false)
          .fetchandsetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int num1 = DialogSearch.intt;
    int num2 = DialogSearch.intt2;
    final avaliablephoness = Provider.of<Products>(context, listen: false);
    final phoness = avaliablephoness.items;
    print('hi');
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
                SizedBox(
                  height: 2,
                ),
                SafeArea(
                  child: Text(
                    "Compare",
                    style: TextStyle(
                        color: Theme.of(context).dividerColor,
                        fontFamily: "RobotoCondensed",
                        fontSize: 20),
                  ),
                ),
                Divider(
                  indent: 100,
                  color: Theme.of(context).backgroundColor,
                  endIndent: 100,
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: weig * .050,
                      right: weig * .050,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: high * .26,
                      color: Theme.of(context).primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: num1 == null
                                ? Container(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            return showDialog (
                                                context: context,
                                                builder: (context) {
                                                  return DialogSearch();
                                                });
                                          });
                                        },
                                        child: SvgPicture.asset(
                                            'assets/images/compare.svg')),
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: weig * .30,
                                            child: Text(
                                              phoness[num1].name,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                  fontFamily: 'Oswald',
                                                  fontSize: 12),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                DialogSearch.intt = null;
                                              });
                                            },
                                            child: Container(
                                              width: weig * .080,
                                              height: high * .040,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    DialogSearch.intt = null;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DialogSearch();
                                              });
                                        },
                                        child: Container(
                                          height: high * .180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      phoness[num1].mainImages),
                                                  fit: BoxFit.fitHeight)),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          Flexible(
                              flex: 1,
                              child: Container(
                                  child: SvgPicture.asset(
                                'assets/images/vs.svg',
                                color: Theme.of(context).accentColor,
                              ))),
                          Flexible(
                            flex: 3,
                            child: num2 == null
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
                                : Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: weig * .30,
                                            child: Text(
                                              phoness[num2].name,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                  fontFamily: 'Oswald',
                                                  fontSize: 12),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                DialogSearch.intt = null;
                                                setState(() {
                                                  CompareScreen();
                                                });
                                              });
                                            },
                                            child: Container(
                                              width: weig * .080,
                                              height: high * .040,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    DialogSearch.intt2 = null;
                                                    setState(() {
                                                      CompareScreen();
                                                    });
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
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
                                        child: Container(
                                          height: high * .180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      phoness[num2].mainImages),
                                                  fit: BoxFit.fitHeight)),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
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
                                  child: (num1 == null)
                                      ? Text('')
                                      : SettingScreen.darktheme
                                          ? Image.network(
                                              phoness[num1].topScreen)
                                          : Image.network(
                                              phoness[num1].lightTopScreen)),
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
                                child: (num2 == null)
                                    ? Text('')
                                    : SettingScreen.darktheme
                                        ? Image.network(phoness[num2].topScreen)
                                        : Image.network(
                                            phoness[num2].lightTopScreen),
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
                Consumer<Products>(
                  builder: (context, phones, child) => Container(
                    width: double.infinity,
                    height: high * .23,
                    child: RowofCompare(
                      firsttext: (num1 == null) ? '' : phoness[num1].screen,
                      secondText: (num2 == null) ? '' : phoness[num2].screen,
                      icon: 'assets/images/screen.svg',
                      name: 'Screen',
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
                    firsttext: (num1 == null) ? '' : phoness[num1].cpu,
                    secondText: (num2 == null) ? '' : phoness[num2].cpu,
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
                    firsttext: (num1 == null) ? '' : phoness[num1].ram,
                    secondText: (num2 == null) ? '' : phoness[num2].ram,
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
                    firsttext: (num1 == null) ? '' : phoness[num1].gpu,
                    secondText: (num2 == null) ? '' : phoness[num2].gpu,
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
                    firsttext: (num1 == null) ? '' : phoness[num1].rearcamera,
                    secondText: (num2 == null) ? '' : phoness[num2].rearcamera,
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
                  height: high * .23,
                  child: RowofCompare(
                    firsttext: (num1 == null) ? '' : phoness[num1].frontcamera,
                    secondText: (num2 == null) ? '' : phoness[num2].frontcamera,
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
                    firsttext: (num1 == null) ? '' : phoness[num1].space,
                    secondText: (num2 == null) ? '' : phoness[num2].space,
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
                        (num1 == null) ? '' : phoness[num1].capstiybattery,
                    secondText:
                        (num2 == null) ? '' : phoness[num2].capstiybattery,
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
                    firsttext: (num1 == null) ? '' : phoness[num1].os,
                    secondText: (num2 == null) ? '' : phoness[num2].os,
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
                                child: (num1 == null)
                                    ? Text('')
                                    : Text(
                                        phoness[num1].aduio,
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
                              child: (num2 == null)
                                  ? Text('')
                                  : Text(
                                      phoness[num2].aduio,
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
                                child: (num1 == null)
                                    ? Text('')
                                    : Text(
                                        phoness[num1].antutue,
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
                              child: (num2 == null)
                                  ? Text('')
                                  : Text(
                                      phoness[num2].antutue,
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
                    firsttext: (num1 == null) ? '' : phoness[num1].more,
                    secondText: (num2 == null) ? '' : phoness[num2].more,
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
                                  (num1 == null)
                                      ? ''
                                      : '''
                                    RP:  ${phoness[num1].respubg}
                                    FP:  ${phoness[num1].respubg}
                                    RC:  ${phoness[num1].rescod}
                                    FC:  ${phoness[num1].rescod}''',
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
                                    (num2 == null)
                                        ? ''
                                        : '''
                                    RP:  ${phoness[num2].respubg}
                                    FP:  ${phoness[num2].respubg}
                                    RC:  ${phoness[num2].rescod}
                                    FC:  ${phoness[num2].rescod}''',
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
                    firsttext: (num1 == null) ? '' : phoness[num1].price,
                    secondText: (num2 == null) ? '' : phoness[num2].price,
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
