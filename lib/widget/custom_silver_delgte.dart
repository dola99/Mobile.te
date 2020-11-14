import 'package:flutter/material.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final String brandimage;
  final String namrcompany;
  final String nameProduct;
  final String price;
  final String mainimage;
  final List<String> allimages;
  CustomSliverDelegate(
      {@required this.expandedHeight,
      this.nameProduct,
      this.namrcompany,
      this.mainimage,
      this.allimages,
      this.price,
      this.hideTitleWhenExpanded = true,
      this.brandimage});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    final appBarSize = expandedHeight - shrinkOffset;

    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              elevation: 0.0,
              title: Opacity(
                opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                child: Column(
                  children: [
                    Text(
                      nameProduct,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Oswald"),
                    )
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
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Stack(
                  children: [
                    Positioned(
                      top: hight * .100,
                      child: Container(
                        height: hight * .0300,
                        width: wight * .40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(brandimage),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                      top: hight * .180,
                      left: wight * .040,
                      child: Container(
                        height: hight * .25,
                        width: wight * .35,
                        child: Text(
                          nameProduct,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Oswald"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .05,
                      right: 0,
                      child: Container(
                        height: hight * .25,
                        width: wight * .35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(mainimage),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      top: hight * .270,
                      left: wight * .20,
                      child: Container(
                        height: hight * .25,
                        width: wight * .35,
                        child: Text(
                          "$price.EGP",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontFamily: "Oswald"),
                        ),
                      ),
                    ),
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
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
