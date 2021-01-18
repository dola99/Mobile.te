import 'package:flutter/material.dart';
import 'package:mobility/screens/Home_Screen.dart';
import 'package:mobility/screens/product_detail_screen.dart';
import '../providers/categorey.dart';
import 'package:mobility/providers/product.dart';
import '../providers/topbanners.dart';
import 'package:provider/provider.dart';

class PageviewBanner extends StatefulWidget {
  @override
  _PageviewBannerState createState() => _PageviewBannerState();
}

class _PageviewBannerState extends State<PageviewBanner> {
  String id;
  int _currentPage = 0;
  int index;
  int indexcategory;
  var _isInit = true;
  var isLoading = false;
  PageController _pagecontroller;

  void _onscroll() {}

  @override
  void initState() {
    _pagecontroller = PageController(initialPage: 0, viewportFraction: 1)
      ..addListener(_onscroll);
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Topbanners>(context, listen: false)
          .fetchAndSetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = HomePage.product;

    final products = HomePage.topbanner;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : PageView.builder(
            onPageChanged: _onchanged,
            itemCount: products.length,
            controller: _pagecontroller,
            itemBuilder: (context, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: GestureDetector(
                onTap: () {
                  fetshItem(products[i].idproduct, HomePage.category, HomePage.product);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                                battery: item[index].capstiybattery,
                                cpu: item[index].cpu,
                                frontcamera: item[index].frontcamera,
                                gpu: item[index].gpu,
                                logo: HomePage.category[indexcategory].logo,
                                mainimage: item[index].mainImages,
                                memory: item[index].space,
                                nameProduct: item[index].name,
                                namrcompany:
                                    HomePage.category[indexcategory].name,
                                os: item[index].os,
                                price: item[index].price,
                                ram: item[index].ram,
                                rearcamera: item[index].rearcamera,
                                screendetails: item[index].screen,
                                topimges: item[index].topScreen,
                                allimages: [item[index].images],
                                fbsPubg: item[index].fbspubg,
                                fbscod: item[index].fbscod,
                                aduio: item[index].aduio,
                                antutu: item[index].antutue,
                                lighttopscreen: item[index].lightTopScreen,
                                more: item[index].more,
                                resPubg: item[index].respubg,
                                rescode: item[index].rescod,
                              )));
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: makepage(products[i].imageUrl),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 8, bottom: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List<Widget>.generate(
                              products.length,
                              (int index) {
                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  height: 10,
                                  width: (index == _currentPage) ? 30 : 10,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 30),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: (index == _currentPage)
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).buttonColor),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget makepage(String image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
    );
  }

  void fetshItem(String id, List<Category> list2, List<Product> list1) {
    List<Product> n = list1;
    List<Category> a = list2;
    for (int k = 0; k <= 100; k++) {
      if (id == n[k].id) {
        print(n[k].name);
        index = k;
        break;
      }
    }
    for (int t = 0; t < a.length; t++) {
      if (n[index].category == a[t].name) {
        indexcategory = t;
        break;
      }
    }
  }
}
