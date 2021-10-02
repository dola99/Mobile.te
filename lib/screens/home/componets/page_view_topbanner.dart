import 'package:flutter/material.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/products.dart';
import 'package:mobility/screens/product/product_detail_screen.dart';
import '../../../models/categorey.dart';
import 'package:mobility/models/product.dart';
import '../../../providers/topbanners.dart';
import 'package:provider/provider.dart';

import '../widgets/indectors_of_topPanner.dart';

class PageviewBanner extends StatefulWidget {
  @override
  _PageviewBannerState createState() => _PageviewBannerState();
}

class _PageviewBannerState extends State<PageviewBanner> {
  String id;
  int _currentPage = 0;
  int index;
  int indexcategory;

  PageController _pagecontroller;

  void _onscroll() {}

  @override
  void initState() {
    _pagecontroller = PageController(
      initialPage: 0,
      viewportFraction: 1,
    )..addListener(_onscroll);
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
      //eturnindexpage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Topbanners>(context).itemsss;
    return PageView.builder(
      onPageChanged: _onchanged,
      itemCount: products.length,
      physics: AlwaysScrollableScrollPhysics(),
      controller: _pagecontroller,
      itemBuilder: (context, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: GestureDetector(
              onTap: () {
                fetshItem(
                    products[i].idproduct,
                    Provider.of<Categorys>(context, listen: false).itemss,
                    Provider.of<Products>(context, listen: false).items);

                var _product = Provider.of<Products>(context, listen: false)
                    .findbyId(products[i].idproduct);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                              product: _product,
                              logo:
                                  Provider.of<Categorys>(context, listen: false)
                                      .itemss[indexcategory]
                                      .logo,
                            )));
              },
              child: AndictorOfTopPanner(
                image: products[i].imageUrl,
                currentPage: _currentPage,
                productlenth: products.length,
              )),
        );
      },
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
