import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/newphoness.dart';
import 'package:mobility/providers/products.dart';
import 'package:mobility/screens/product/product_detail_screen.dart';
import 'package:mobility/screens/home/widgets/Continer_of_newItem.dart';

import 'package:provider/provider.dart';

class NewPhones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<NewPhoness>(context).items.reversed.toList();
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(defaultScreenWidth, defaultScreenHeight),
        orientation: Orientation.portrait);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              ScreenUtil().setWidth(290) / ScreenUtil().setHeight(300),
          crossAxisCount: 2,
          crossAxisSpacing: ScreenUtil().setWidth(18),
          mainAxisSpacing: 10),
      itemCount: items.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: items[i],
        child: InkWell(
          onTap: () {
            var product = Provider.of<Products>(context, listen: false)
                .findbyId(items[i].idproduct);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(product: product, logo: items[i].logo),
              ),
            );
          },
          child: ContainerOfNewItem(
            image: items[i].imageUrl,
            text: items[i].color,
            logo: items[i].logo,
          ),
        ),
      ),
    );
  }
}
