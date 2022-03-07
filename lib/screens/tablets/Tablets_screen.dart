import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobility/models/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/tablets.dart';
import 'package:mobility/screens/product/product_detail_screen.dart';
import 'package:provider/provider.dart';

class TabletsScreen extends StatefulWidget {
  static const routeName = '/Tablets_screen';

  @override
  _TabletsScreenState createState() => _TabletsScreenState();
}

class _TabletsScreenState extends State<TabletsScreen> {
  BannerAd? _bannerAd;
  void _loadBannerAd() {
    _bannerAd!.load();
  }

  @override
  void initState() {
    _bannerAd = BannerAd(
      request: const AdRequest(),
      listener: const BannerAdListener(),
      adUnitId: 'ca-app-pub-4854420444519405/8928756776',
      size: AdSize.banner,
    );
    _loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  var _isInit = true;
  bool isLoading = false;
  late int chose;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Tablets>(context, listen: false)
          .fetchandsetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
        Provider.of<Categorys>(context, listen: false).fetchandsetProducts();
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Tablets>(context, listen: false);
    final products = loadedproducts.items;
    final loadedCate = Provider.of<Categorys>(context, listen: false);
    final cate = loadedCate.itemss;
    final high = MediaQuery.of(context).size.height;
    final wigh = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(2.123234262925839e-17, 2),
            end: Alignment(-5.4, 2.123234262925839e-12),
            colors: [
              Color.fromRGBO(255, 189, 89, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(255, 189, 89, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: high * .040,
                          width: wigh * .070,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          width: wigh * .55,
                          height: high * .040,
                          child: const Text(
                            "Tablets",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "RobotoCondensed",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black),
                  ],
                ),
              ),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else
                Padding(
                  padding: EdgeInsets.only(
                    top: high * .1,
                    left: wigh * .03,
                    right: wigh * .03,
                    bottom: high * .060,
                  ),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (ctx, index) {
                      chosen(cate, products[index].category);
                      return GestureDetector(
                        onTap: () {
                          chosen(cate, products[index].category);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailScreen(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: high * .1,
                              top: high * .08,
                              right: wigh * .02,
                              left: wigh * .02,
                              child: SizedBox(
                                width: wigh * .3,
                                height: high * .02,
                                child: Image.network(
                                  products[index].mainImages!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: high * .035,
                              left: wigh * .025,
                              right: wigh * .04,
                              child: SizedBox(
                                height: high * .06,
                                width: wigh * .05,
                                child: Text(
                                  products[index].name!,
                                  style: TextStyle(
                                    color: Theme.of(context).dividerColor,
                                    fontSize: ScreenUtil().setSp(15),
                                    fontFamily: 'Oswald',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: high * .01,
                              left: wigh * .045,
                              right: wigh * .05,
                              child: SizedBox(
                                height: high * .07,
                                width: wigh * .05,
                                child: Image.network(cate[chose].logo!),
                              ),
                            ),
                            Positioned(
                              bottom: high * .01,
                              right: wigh * .05,
                              left: wigh * .05,
                              child: SizedBox(
                                width: wigh * .05,
                                child: Center(
                                  child: Text(
                                    "Start From: ${products[index].price}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(10),
                                      fontFamily: 'Oswald',
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void chosen(List<Category> list, String? string) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].name == string) {
        chose = i;
      }
    }
  }
}
