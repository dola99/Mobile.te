import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobility/providers/watches.dart';
import 'package:provider/provider.dart';

class WatchesScreen extends StatefulWidget {
  static const routeName = "/Watches_screen";

  @override
  _WatchesScreenState createState() => _WatchesScreenState();
}

class _WatchesScreenState extends State<WatchesScreen> {
  var _isInit = true;
  var isLoading = false;
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
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Watches>(context);
    final products = loadedproducts.items;
    final high = MediaQuery.of(context).size.height;
    final wigh = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(39, 43, 54, 1),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "All Watch :",
                  style: TextStyle(
                      color: Color.fromRGBO(236, 236, 238, 1),
                      fontSize: 20,
                      fontFamily: "RobotoCondensed"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2/3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(products[index].id);
                            },
                            child: Container(
                              width: wigh * .25,
                              height: high * .20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      products[index].mainIages,
                                    ),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: wigh * .06,
                            child: Container(
                              width: wigh * .25,
                              height: high *.1,
                              child: Row(
                                
                                children: [
                                  Flexible(
                                    child: Text(
                                      products[index].name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
