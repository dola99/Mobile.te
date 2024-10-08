import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/screens/brands/mobile_category_screen.dart';
import 'package:provider/provider.dart';

class GridCategory extends StatelessWidget {
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
        mainAxisSpacing: MediaQuery.of(context).size.height * .0200,
      ),
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
                        margin: const EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl: _product[index].logo!,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Center(
                        child: Text(
                          _product[index].name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'RobotoCondensed',
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
