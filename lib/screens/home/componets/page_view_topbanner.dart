import 'package:flutter/material.dart';
import 'package:mobility/models/categorey.dart';
import 'package:mobility/models/product.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/products.dart';
import 'package:mobility/providers/topbanners.dart';
import 'package:mobility/screens/home/widgets/indectors_of_top_panner.dart';
import 'package:mobility/screens/product/product_detail_screen.dart';
import 'package:provider/provider.dart';

class PageviewBanner extends StatefulWidget {
  @override
  _PageviewBannerState createState() => _PageviewBannerState();
}

class _PageviewBannerState extends State<PageviewBanner> {
  String? id;
  int _currentPage = 0;
  late int index;
  late int indexcategory;

  PageController? _pagecontroller;

  void _onscroll() {}

  @override
  void initState() {
    _pagecontroller = PageController()..addListener(_onscroll);

    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller!.dispose();
    super.dispose();
  }

  void _onchanged(int index) {
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
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _pagecontroller,
      itemBuilder: (context, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: GestureDetector(
            onTap: () {
              print(products[i].idproduct);
              final _product = Provider.of<Products>(context, listen: false)
                  .findbyId(products[i].idproduct);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: _product,
                    logo: Provider.of<Categorys>(context, listen: false)
                        .itemss[indexcategory]
                        .logo,
                  ),
                ),
              );
            },
            child: AndictorOfTopPanner(
              image: products[i].imageUrl,
              currentPage: _currentPage,
              productlenth: products.length,
            ),
          ),
        );
      },
    );
  }

  void fetshItem(String? id, List<Category> list2, List<Product> list1) {
  
    list1.firstWhere((element) => element.id==id);
    for (int t = 0; t < list2.length; t++) {
      if (list1[index].category == list2[t].name) {
        indexcategory = t;
        break;
      }
    }
  }
}
