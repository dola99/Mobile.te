import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/compare_screen_provider.dart';
import 'package:mobility/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SilverAppBar extends StatelessWidget {
  final String? name;
  final String? category;
  final String? imageproduct;
  final String? logo;
  final String? id;
  const SilverAppBar({
    this.name,
    this.imageproduct,
    this.category,
    this.logo,
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;

    return SliverAppBar(
      expandedHeight: 400.h,
      backgroundColor: Theme.of(context).disabledColor,
      iconTheme: const IconThemeData(color: Colors.black),
      pinned: true,
      stretch: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50.h,
            width: 80.w,
            child: Center(
              child: Image.network(logo!),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: 8.h, left: 8.w, right: 8.w, top: 8.h),
          child: SizedBox(
            height: 50.h,
            width: 30.w,
            child: Center(
              child: IconButton(
                tooltip: 'Add To Compare',
                onPressed: () => Provider.of<Compare>(context, listen: false)
                    .addproduct(id, products),
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          name!,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "RobotoCondensed",
          ),
        ),
        background: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Stack(
            children: [
              Positioned(
                top: 100.h,
                left: 5.w,
                right: 5.w,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(.5),
                      highlightColor: Colors.grey[300]!,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            category!,
                            strutStyle: const StrutStyle(),
                            style: const TextStyle(
                              fontSize: 300,
                              fontFamily: "Oswald",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 45.h,
                left: 100.w,
                right: 100.w,
                child: Container(
                  height: 330.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                  ),
                ),
              ),
              Positioned(
                top: 50.h,
                left: 85.w,
                right: 80.w,
                child: SizedBox(
                  height: 250.h,
                  child: Center(
                    child: Image.network(
                      imageproduct!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              /*  Positioned(
                  bottom: 0.h,
                  right: 60.w,
                  child: Container(
                    height: 250.h,
                    child: Center(
                        child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.navigate_next,
                        size: 30,
                        color: Colors.black,
                      ),
                    )),
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: 60.w,
                  child: Container(
                    height: 250.h,
                    child: Center(
                        child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.black,
                      ),
                    )),
                  ),
                ),*/
            ],
          ),
        ),
      ),
    );
  }
}
