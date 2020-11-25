import 'package:flutter/material.dart';
import 'package:mobility/providers/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/product.dart';
import 'package:mobility/providers/products.dart';
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
      Provider.of<Products>(context).fetchandsetProducts();
      Provider.of<Categorys>(context).fetchandsetProducts();
      Provider.of<NewPhoness>(context).fetchandSetsProducts().then((_) {
        setState(() {
          isLoading = true;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadIdCategory = Provider.of<Categorys>(context);
    final categrey = loadIdCategory.itemss;
    final loadItem = Provider.of<Products>(context);
    final item = loadItem.items;
    final hight = MediaQuery.of(context).size.height;
    final weight = MediaQuery.of(context).size.height;
    final loaded = Provider.of<NewPhoness>(context);
    final products = loaded.items;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .87,
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 20),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: GestureDetector(
          onTap: () {
            fetshItem(products[index].idproduct, categrey, item);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                          battery: item[index].capstiybattery,
                          cpu: item[index].cpu,
                          frontcamera: item[index].frontcamera,
                          gpu: item[index].gpu,
                          logo: categrey[indexcategory].logo,
                          mainimage: item[index].mainImages,
                          memory: item[index].space,
                          nameProduct: item[index].name,
                          namrcompany: categrey[indexcategory].name,
                          os: item[index].os,
                          price: item[index].price,
                          ram: item[index].ram,
                          rearcamera: item[index].rearcamera,
                          screendetails: item[index].screen,
                          topimges: item[index].topScreen,
                          allimages: [item[index].images],
                        )));
          },
          child: Container(
            width: weight * .190,
            height: hight * .200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: hight * .0350,
                  left: weight * .01,
                  child: Container(
                    width: weight * .12,
                    height: hight * .05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      ),
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: hight * .0450,
                  left: weight * .050,
                  child: Text(
                    'New',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Oswald',
                      fontSize: 15,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: hight * .0340,
                  bottom: hight * .10,
                  left: weight * .0180,
                  child: Container(
                    width: weight * .080,
                    height: hight * .070,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(products[index].logo),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Positioned(
                  bottom: hight * .0250,
                  right: weight * .0150,
                  child: Container(
                    width: weight * .065,
                    height: hight * .180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(products[index].imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  bottom: hight * .003,
                  left: weight * .050,
                  child: Text(
                    products[index].color,
                    style: TextStyle(
                      color: Theme.of(context).dividerColor,
                      fontSize: 14,
                      fontFamily: 'RobotoCondensed',
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
