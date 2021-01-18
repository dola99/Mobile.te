import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobility/screens/compare_screen.dart';
import '../widget/dialog_search.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class TopBarCompareScreen extends StatefulWidget {
  @override
  _TopBarCompareScreenState createState() => _TopBarCompareScreenState();
}

class _TopBarCompareScreenState extends State<TopBarCompareScreen> {
  @override
  Widget build(BuildContext context) {
    int num1 = DialogSearch.intt;
    int num2 = DialogSearch.intt2;
    final heightt = MediaQuery.of(context).size.height;
    final weigh = MediaQuery.of(context).size.width;
    return Consumer<Products>(
      builder: (context, product, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: weigh * .050,
            right: weigh * .050,
          ),
          child: Container(
            width: double.infinity,
            height: heightt * .26,
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
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: weigh * .30,
                                  child: Text(
                                    product.items[num1].name,
                                    style: TextStyle(
                                        color: Theme.of(context).dividerColor,
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
                                    width: weigh * .080,
                                    height: heightt * .040,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          DialogSearch.intt = null;
                                          setState(() {
                                            CompareScreen();
                                          });
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
                                setState(() {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DialogSearch();
                                      });
                                });
                              },
                              child: Container(
                                height: heightt * .180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            product.items[num1].mainImages),
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
                                  width: weigh * .30,
                                  child: Text(
                                    product.items[num2].name,
                                    style: TextStyle(
                                        color: Theme.of(context).dividerColor,
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
                                    width: weigh * .080,
                                    height: heightt * .040,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Theme.of(context).accentColor,
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
                              onTap: () {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DialogSearch();
                                    });
                              },
                              child: Container(
                                height: heightt * .180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            product.items[num2].mainImages),
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
    );
  }
}
