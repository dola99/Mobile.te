import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/newphone.dart';
import 'package:mobility/providers/newphoness.dart';
import 'package:mobility/providers/product.dart';
import 'package:mobility/providers/products.dart';
import 'package:mobility/providers/tobbanner.dart';
import 'package:mobility/providers/topbanners.dart';
import 'package:mobility/widget/flat_buttons.dart';
import 'package:provider/provider.dart';
import '../widget/new_phone_item.dart';
import 'package:flutter/material.dart';
import '../widget/page_view_topbanner.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_screen";
  static List<Category> category = [];
  static List<NewPhone> newPhone = [];
  static List<Product> product = [];
  static List<TopBanner> topbanner = [];
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInit = true;
  var isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context, listen: false)
          .fetchandsetProducts()
          .then((_) {
        setState(() {
          HomePage.product =
              Provider.of<Products>(context, listen: false).items;
        });
      });
      Provider.of<Categorys>(context, listen: false).fetchandsetProducts();
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
    final loadIdCategory = Provider.of<Categorys>(context, listen: false);
    HomePage.category = loadIdCategory.itemss;
    final loadednewphone = Provider.of<NewPhoness>(context, listen: false);
    HomePage.newPhone = loadednewphone.items;
    final loadedtopbanner = Provider.of<Topbanners>(context, listen: false);
    HomePage.topbanner = loadedtopbanner.itemsss;
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true)
      ..init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: ScreenUtil.instance.setHeight(260),
                child: PageviewBanner(),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Center(
              child: Text(
                "_________",
                style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(20),
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(5),
            ),
            Center(child: FlatButtons()),
            SizedBox(
              height: ScreenUtil.instance.setHeight(5),
            ),
            Container(
              width: ScreenUtil.instance.setWidth(380),
              child: Center(
                child: Text(
                  "Recenty",
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    fontFamily: 'RobotoCondensed',
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(25),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
                width: ScreenUtil.instance.setWidth(380),
                height: ScreenUtil.instance.setHeight(630),
                child: NewPhones()),
          ],
        ),
      ),
    );
  }
}
