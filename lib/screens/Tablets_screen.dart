import 'package:flutter/material.dart';
import 'package:mobility/providers/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/tablets.dart';
import 'package:mobility/screens/product_detail_screen.dart';

import 'package:provider/provider.dart';

class TabletsScreen extends StatefulWidget {
  static const routeName = '/Tablets_screen';

  @override
  _TabletsScreenState createState() => _TabletsScreenState();
}

class _TabletsScreenState extends State<TabletsScreen> {
  var _isInit = true;
  var isLoading = false;
  int chose;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Tablets>(context).fetchandsetProducts().then((_) {
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
    final loadedproducts = Provider.of<Tablets>(context);
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
                Color.fromRGBO(255, 189, 89, 1),
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(255, 189, 89, 1),
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
                                color: Colors.white
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        Container(
                          width: wigh * .55,
                          height: high * .040,
                          child: Text(
                            "Tablets",
                            style: TextStyle(
                                color: Colors.white,
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
                            chosen(cate, products[index].category);
                            return GestureDetector(
                              onTap: () {
                                chosen(cate, products[index].category);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      allimages: [products[index].images],
                                      battery: products[index].capstiybattery,
                                      cpu: products[index].cpu,
                                      frontcamera: products[index].frontcamera,
                                      gpu: products[index].gpu,
                                      logo: cate[chose].logo,
                                      mainimage: products[index].mainImages,
                                      memory: products[index].space,
                                      nameProduct: products[index].name,
                                      namrcompany: cate[chose].name,
                                      os: products[index].os,
                                      price: products[index].price,
                                      ram: products[index].ram,
                                      rearcamera: products[index].rearcamera,
                                      screendetails: products[index].screen,
                                      topimges: products[index].topScreen,
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
                                          products[index].mainImages,
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
