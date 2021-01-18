import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobility/screens/MobileCategoryScreen.dart';
import '../providers/categorys.dart';
import 'package:provider/provider.dart';

class GridCategory extends StatefulWidget {
  @override
  _GridCategoryState createState() => _GridCategoryState();
}

class _GridCategoryState extends State<GridCategory> {
  @override
  Widget build(BuildContext context) {
    final _allproduct = Provider.of<Categorys>(context, listen: false);
    final _product = _allproduct.itemss;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: _product.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: MediaQuery.of(context).size.height * .0200),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: _product[index],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                {
                  Navigator.pushNamed(
                    context,
                    MobileCategoryScreen.routeName,
                    arguments: ScreenArguments(
                      name: _product[index].name,
                      imagesurl: _product[index].logo,
                    ),
                  );
                }
              },
              child: Stack(
                children: [
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * .045,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .090,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * .050,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl: _product[index].logo,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        child: Center(
                          child: Text(
                            _product[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'RobotoCondensed'),
                          ),
                        ),
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
