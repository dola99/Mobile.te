import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/providers/compare_screen_provider.dart';
import 'package:mobility/providers/products.dart';
import 'package:provider/provider.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final String? brandimage;
  final String? namrcompany;
  final String? nameProduct;
  final String? price;
  final String? mainimage;
  final String? id;
  final List<String>? allimages;
  CustomSliverDelegate({
    required this.expandedHeight,
    this.nameProduct,
    this.namrcompany,
    this.mainimage,
    this.allimages,
    this.price,
    this.id,
    this.hideTitleWhenExpanded = true,
    this.brandimage,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final products = Provider.of<Products>(context).items;
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    final appBarSize = expandedHeight - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 1.6,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Opacity(
                opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 80.w,
                      child: Center(
                        child: Image.network(
                          brandimage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      nameProduct!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Oswald",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h,
                        left: 8.w,
                        right: 8.w,
                        top: 8.h,
                      ),
                      child: SizedBox(
                        height: 50.h,
                        width: 30.w,
                        child: Center(
                          child: IconButton(
                            tooltip: 'Add To Compare',
                            onPressed: () =>
                                Provider.of<Compare>(context, listen: false)
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
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0,
            top: 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0 * percent),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20.h,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: hight * .1000,
                          width: wight * .30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(brandimage!),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90.h,
                      left: wight * .00,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: hight * .10,
                          width: wight * .35,
                          child: Text(
                            nameProduct!,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Oswald",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .03,
                      right: 50.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: wight * .45,
                          height: hight * .35,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                offset: const Offset(10, 20),
                                blurRadius:
                                    MediaQuery.of(context).size.aspectRatio *
                                        10,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .05,
                      right: wight * .010,
                      left: wight * .28,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: hight * .32,
                          width: wight * .1,
                          child: Image.network(
                            mainimage!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .25,
                      left: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: hight * .25,
                          width: wight * .35,
                          child: Text(
                            "$price.EGP",
                            style: TextStyle(
                              color: Colors.orange[900],
                              fontSize: ScreenUtil().setSp(15),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Oswald",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .02,
                      right: 2.w,
                      child: SizedBox(
                        height: hight * .46,
                        width: wight * .14,
                        child: Column(
                          children: [
                            const Icon(Icons.arrow_drop_up_rounded),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(mainimage!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(mainimage!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(mainimage!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(mainimage!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ),
                    /*Positioned(
                      bottom: 0,
                      left: 130.w,
                      child: GestureDetector(
                        onTap: () async {
                          await Provider.of<Compare>(context, listen: false)
                              .addproduct(id, products);
                        },
                        child: Container(
                          width: 150.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Add To Compare",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontFamily: 'Oswald'),
                          )),
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight - 80.h;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
