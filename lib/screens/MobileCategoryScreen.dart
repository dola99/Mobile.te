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
    final _phoness = _availablePhones.items.reversed;
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
              color: Theme.of(context).dividerColor, fontSize: 18, fontFamily: 'RobotoCondensed'),
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
            childAspectRatio: (wight / hight)*1.19,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0),
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
                    os: displayedPhones[index].os,
                    nameProduct: displayedPhones[index].name,
                    ram: displayedPhones[index].ram,
                    battery: displayedPhones[index].speedofcharge,
                    namrcompany: args.name,
                    screendetails: displayedPhones[index].screen,
                    price: displayedPhones[index].price,
                    cpu: displayedPhones[index].cpu,
                    topimges: displayedPhones[index].topScreen,
                    rearcamera: displayedPhones[index].rearcamera,
                    frontcamera: displayedPhones[index].frontcamera,
                    gpu: displayedPhones[index].gpu,
                    memory: displayedPhones[index].space,
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
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                          top: hight * .0000001,
                          left: wight * .01,
                          right: wight * .01,
                          bottom: hight * .1,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
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
                          top: hight * .010,
                          left: wight * .01,
                          right: wight * .01,
                          bottom: hight * .11,
                          child: Container(
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
                        Positioned(
                          bottom: hight * .034,
                          left: wight * .02,
                          right: wight * .02,
                          top: hight * .274,
                          child: Text(
                            args.name,
                            style: TextStyle(
                                color: Theme.of(context).textSelectionColor,
                                fontSize: 15,
                                fontFamily: 'RobotoCondensed'),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .085,
                          left: wight * .077,
                          right: wight * .065,
                          top: hight * .252,
                          child: Container(
                            child: Text(
                              "_____________",
                              style:
                                  TextStyle(color: Theme.of(context).focusColor, fontSize: 15),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .005,
                          right: wight * .05,
                          top: hight * .297,
                          left: wight * .02,
                          child: Container(
                            width: wight * .55,
                            height: hight * .050,
                            child: Text(
                              displayedPhones[index].name,
                              style: TextStyle(
                                  color: Theme.of(context).dividerColor,
                                  fontSize: 15,
                                  fontFamily: 'RobotoCondensed'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: hight * .000,
                          left: wight * .02,
                          right: wight * .090,
                          top: hight * .342,
                          child: Text(
                            '${displayedPhones[index].price} E.G.P',
                            style: TextStyle(
                                color: Theme.of(context).bottomAppBarColor,
                                fontSize: 15,
                                fontFamily: 'RobotoCondensed'),
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
