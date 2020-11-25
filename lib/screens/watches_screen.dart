import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobility/providers/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/watches.dart';
import 'package:mobility/screens/watch_product_screen.dart';
import 'package:provider/provider.dart';

class WatchesScreen extends StatefulWidget {
  static const routeName = "/Watches_screen";

  @override
  _WatchesScreenState createState() => _WatchesScreenState();
}

class _WatchesScreenState extends State<WatchesScreen> {
  var _isInit = true;
  var isLoading = false;
  int chose;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Watches>(context).fetchandsetProducts().then((_) {
        setState(() {
          isLoading = false;
        });
        Provider.of<Categorys>(context).fetchandsetProducts();
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Watches>(context);
    final products = loadedproducts.items;
    final loadedCate = Provider.of<Categorys>(context);
    final cate = loadedCate.itemss;
    final high = MediaQuery.of(context).size.height;
    final wigh = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(2.123234262925839e-17, 2),
              end: Alignment(-5.4, 2.123234262925839e-12),
              colors: [
                Color.fromRGBO(252, 213, 5, 1),
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(252, 213, 5, 1),
                Color.fromRGBO(0, 0, 0, 1),
              ]),
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
                        Container(
                          height: high * .040,
                          width: wigh * .070,
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        Container(
                          width: wigh * .6,
                          height: high * .040,
                          child: Text(
                            "Smart Watch :",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "RobotoCondensed"),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black),
                  ],
                ),
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.only(
                          top: high * .1, left: wigh * .03, right: wigh * .03),
                      child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.5,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (ctx, index) {
                            chosen(cate, products[index].brand);
                            return GestureDetector(
                              onTap: () {
                                chosen(cate, products[index].brand);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductWatchDetailScreen(
                                      waterproof: products[index].waterproof,
                                      warrenty: products[index].warranty,
                                      type: products[index].type,
                                      protatype: products[index].prototype,
                                      price: products[index].price,
                                      memory: products[index].memory,
                                      images: [products[index].images],
                                      dimensios: products[index].dimensios,
                                      comatabilty: products[index].comatabilty,
                                      colors: products[index].colors,
                                      battery: products[index].battery,
                                      alwayswork: products[index].alwayswork,
                                      blutooth: products[index].blutoothversion,
                                      screenType: products[index].screentype,
                                      batterycapacity: products[index].battery,
                                      size: products[index].screensize,
                                      os: products[index].os,
                                      nameProduct: products[index].name,
                                      logo: cate[chose].logo,
                                      mainImage: products[index].mainIages,
                                    ),
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
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: high * .1,
                                    top: high * .08,
                                    right: wigh * .02,
                                    left: wigh * .02,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: wigh * .3,
                                        height: high * .02,
                                        child: Image.network(
                                          products[index].mainIages,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: high * .3,
                                    bottom: high * .02,
                                    left: wigh * .025,
                                    right: wigh * .04,
                                    child: Container(
                                      child: Text(
                                        products[index].name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Oswald'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: high * .02,
                                    bottom: high * .3,
                                    left: wigh * .025,
                                    right: wigh * .04,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(cate[chose].logo),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: high * .37,
                                    bottom: high * .00,
                                    left: wigh * .070,
                                    right: wigh * .01,
                                    child: Container(
                                      child: Text(
                                        "Start From: ${products[index].price}",
                                        style: TextStyle(
                                            fontSize: 10, fontFamily: 'Oswald'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void chosen(List<Category> list, String string) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].name == string) {
        chose = i;
      }
    }
  }
}
