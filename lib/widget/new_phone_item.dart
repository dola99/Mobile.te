import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/categorey.dart';
import 'package:mobility/providers/product.dart';

import 'package:mobility/screens/Home_Screen.dart';
import 'package:mobility/screens/product_detail_screen.dart';
import '../providers/newphoness.dart';

import 'package:provider/provider.dart';

class NewPhones extends StatefulWidget {
  @override
  _NewPhonesState createState() => _NewPhonesState();
}

class _NewPhonesState extends State<NewPhones> {
  int index;
  int indexcategory;
  var _isInit = true;
  var isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<NewPhoness>(context, listen: false)
          .fetchandSetsProducts()
          .then((_) {
        setState(() {
          isLoading = true;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true)
      ..init(context);
    final item = HomePage.product;
    final products = HomePage.newPhone.reversed.toList();
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: ScreenUtil.instance.setWidth(290) /
              ScreenUtil.instance.setHeight(300),
          crossAxisCount: 2,
          crossAxisSpacing: ScreenUtil.instance.setWidth(18),
          mainAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: GestureDetector(
          onTap: () {
            fetshItem(products[i].idproduct, HomePage.category, item);
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
                  namrcompany: HomePage.category[indexcategory].name,
                  os: item[index].os,
                  price: item[index].price,
                  ram: item[index].ram,
                  aduio: item[index].aduio,
                  antutu: item[index].antutue,
                  lighttopscreen: item[index].lightTopScreen,
                  more: item[index].more,
                  rearcamera: item[index].rearcamera,
                  screendetails: item[index].screen,
                  topimges: item[index].topScreen,
                  allimages: [item[index].images],
                  fbsPubg: item[index].fbspubg,
                  fbscod: item[index].fbscod,
                  resPubg: item[index].respubg,
                  rescode: item[index].rescod,
                ),
              ),
            );
          },
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: ScreenUtil.instance.setHeight(55),
                  left: ScreenUtil.instance.setWidth(3),
                  child: Container(
                    width: ScreenUtil.instance.setWidth(120),
                    height: ScreenUtil.instance.setHeight(35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      ),
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil.instance.setHeight(60),
                  left: ScreenUtil.instance.setWidth(50),
                  child: Text(
                    'New',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Oswald',
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil.instance.setHeight(20),
                  left: ScreenUtil.instance.setWidth(10),
                  child: Container(
                    width: ScreenUtil.instance.setWidth(90),
                    height: ScreenUtil.instance.setWidth(90),
                    child: CachedNetworkImage(
                      imageUrl: products[i].logo,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil.instance.setHeight(0),
                  right: ScreenUtil.instance.setWidth(3),
                  child: Container(
                    
                    width: ScreenUtil.instance.setWidth(70),
                    height: ScreenUtil.instance.setWidth(180),
                    child: CachedNetworkImage(
                      imageUrl: products[i].imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil.instance.setHeight(7),
                  left: ScreenUtil.instance.setHeight(3),
                  child: Container(
                    height: ScreenUtil.instance.setHeight(45),
                    width: ScreenUtil.instance.setWidth(105),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(10)),
                      child: Text(
                        products[i].color,
                        style: TextStyle(
                          color: Theme.of(context).dividerColor,
                          fontSize:
                              ScreenUtil(allowFontScaling: true).setSp(16),
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetshItem(String id, List<Category> list2, List<Product> list1) {
    List<Product> n = [];
    List<Category> a = [];
    a = list2;
    n = list1;

    for (int k = 0; k < n.length; k++) {
      if (n[k].id == id) {
        print(k);
        print(n[k].name);
        index = k;
      }
    }
    for (int t = 0; t < a.length; t++) {
      if (n[index].category == a[t].name) {
        indexcategory = t;
      }
    }
  }
}
