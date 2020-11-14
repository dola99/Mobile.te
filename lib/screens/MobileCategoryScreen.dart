import 'package:flutter/material.dart';
import 'package:mobility/providers/product.dart';
import 'package:mobility/screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ScreenArguments {
  final String name;
  final String imagesurl;
  ScreenArguments({
    this.name,
    this.imagesurl,
  });
}

class MobileCategoryScreen extends StatefulWidget {
  static const routeName = "/MobileCategory";

  @override
  _MobileCategoryScreenState createState() => _MobileCategoryScreenState();
}

class _MobileCategoryScreenState extends State<MobileCategoryScreen> {
  String categoryName;
  List<Product> displayedPhones;
  var _isInit = true;
  var isLoading = false;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context).fetchandsetProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInit = false;
    final _availablePhones = Provider.of<Products>(context);
    final _phoness = _availablePhones.items;
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    if (_loadedInitData == false) {
      categoryName = args.name;
      displayedPhones = _phoness.where((element) {
        return element.category.contains(categoryName);
      }).toList();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          args.name,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'RobotoCondensed'),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .200,
                padding: EdgeInsets.only(right: 10),
                child: Image.network(
                  args.imagesurl,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height / 1800,
            crossAxisSpacing: wight * .001,
            mainAxisSpacing: hight * .003),
        itemCount: displayedPhones.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: displayedPhones[index],
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    logo: args.imagesurl,
                    mainimage: displayedPhones[index].mainImages,
                    allimages: [displayedPhones[index].images],
                    nameProduct: displayedPhones[index].name,
                    namrcompany: args.name,
                    screendetails: displayedPhones[index].screen,
                    price: displayedPhones[index].price,
                    cpu: displayedPhones[index].cpu,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        Positioned(
                          top: 2,
                          left: wight * .01,
                          right: wight * .01,
                          child: Container(
                            height: hight * .260,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: hight * .002,
                          left: wight * .01,
                          right: wight * .01,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: hight * .230,
                              width: wight * .070,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(21),
                                  bottomLeft: Radius.circular(21),
                                  topRight: Radius.circular(21),
                                  bottomRight: Radius.circular(21),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.025),
                                      offset: Offset(0, 4),
                                      blurRadius: 4)
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                      displayedPhones[index].mainImages,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .165,
                          left: wight * .01,
                          right: wight * .01,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              args.name,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: 'RobotoCondensed'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .0170,
                          left: wight * .05,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Container(
                              height: hight * .20,
                              child: Text(
                                "____________",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .110,
                          left: wight * .01,
                          right: wight * .01,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 5),
                            child: Center(
                              child: Text(
                                displayedPhones[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'RobotoCondensed'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .085,
                          left: wight * .01,
                          right: wight * .01,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '${displayedPhones[index].price} L.e',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: 'RobotoCondensed'),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
