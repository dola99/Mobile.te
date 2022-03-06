import 'package:flutter/material.dart';
import 'package:mobility/models/product.dart';
import 'package:mobility/screens/product/product_detail_screen.dart';
import 'package:mobility/screens/brands/componets/Item_of_MobileCategory.dart';
import '../../models/product.dart';
import '../../providers/products.dart';
import 'package:provider/provider.dart';

class ScreenArguments {
  final String? name;
  final String? imagesurl;
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
  String? categoryName;
  late List<Product> displayedPhones;

  var isLoading = false;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final _availablePhones = Provider.of<Products>(context, listen: false);
    final _phoness = _availablePhones.items.reversed;
    final ScreenArguments? args = ModalRoute.of(context)!.settings.arguments as ScreenArguments?;
    if (_loadedInitData == false) {
      categoryName = args!.name;
      displayedPhones = _phoness.where((element) {
        return element.category!.contains(categoryName!);
      }).toList();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    final ScreenArguments args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          args.name!,
          style: TextStyle(
              color: Theme.of(context).dividerColor,
              fontSize: 18,
              fontFamily: 'RobotoCondensed'),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .200,
                padding: EdgeInsets.only(right: 10),
                child: Image.network(
                  args.imagesurl!,
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
            childAspectRatio: (wight / hight) * 1.19,
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
                    product: displayedPhones[index],
                    logo: args.imagesurl,
                  ),
                ),
              );
            },
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 35, bottom: 20, top: 20, right: 20),
                child: MobileItemCategry(
                  companyname: args.name,
                  image: displayedPhones[index].mainImages,
                  price: displayedPhones[index].price,
                  productnme: displayedPhones[index].name,
                )),
          ),
        ),
      ),
    );
  }
}
