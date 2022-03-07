import 'package:flutter/material.dart';
import 'package:mobility/models/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/gamers.dart';
import 'package:mobility/screens/gamer/componets/gamer_product_screen.dart';
import 'package:mobility/screens/gamer/widgets/container_gamer.dart';
import 'package:provider/provider.dart';
//import 'dart:math';

class GamerScreen extends StatefulWidget {
  static const routename = '/Gamer_Screen';

  @override
  _GamerScreenState createState() => _GamerScreenState();
}

class _GamerScreenState extends State<GamerScreen> {
  PageController? pageController;
  double viewportFuncation = 0.8;
  double? pageOffset = 0;
  late int chose;
  bool _isInit = true;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: viewportFuncation)
      ..addListener(() {
        setState(() {
          pageOffset = pageController!.page;
        });
      });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });

      Provider.of<Gamers>(context, listen: false)
          .fetchandsetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Gamers>(context, listen: false);
    final cate = Provider.of<Categorys>(context).itemss;
    final products = loadedproducts.items;
    final hig = MediaQuery.of(context).size.height;
    final wiq = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(hig * .2123234262925839e-17, hig * .0022),
                end: const Alignment(-5.4, 2.123234262925839e-12),
                colors: const [
                  Color.fromRGBO(198, 16, 16, 1),
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(198, 16, 16, 1),
                  Color.fromRGBO(0, 0, 0, 1),
                ],
              ),
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            Positioned(
              top: hig * .060,
              left: wiq * .420,
              child: const Text(
                "Gamer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Oswald',
                ),
              ),
            ),
          PageView.builder(
            controller: pageController,
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              // double scale = max(viewportFuncation,
              //(1 - (pageOffset - index).abs()) + viewportFuncation);
              double angle = (pageOffset! - index).abs();
              if (angle > 0.5) {
                angle = 1 - angle;
              }
              return GestureDetector(
                onTap: () {
                  chosen(cate, products[index].category);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GamerProductScreen(
                        gamer: products[index],
                        logo: cate[chose].logo,
                      ),
                    ),
                  );
                },
                child: ContainerOfGamer(
                  angle: angle,
                  category: products[index].category,
                  fbscod: products[index].fbscod,
                  fbspubg: products[index].fbspubg,
                  mainImage: products[index].mainImages,
                  name: products[index].name,
                  price: products[index].price,
                  rescod: products[index].rescod,
                  respubg: products[index].respubg,
                  size: products[index].size,
                ),
              );
            },
          ),
          Positioned(
            top: hig * .055,
            left: wiq * .030,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
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
