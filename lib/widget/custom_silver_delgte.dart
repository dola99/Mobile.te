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
                padding: EdgeInsets.symmetric(horizontal: 0 * percent),
                child: Stack(
                  children: [
                    
                    Positioned(
                      top: hight * .070,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: hight * .1000,
                          width: wight * .30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(brandimage),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .180,
                      left: wight * .00,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: hight * .25,
                          width: wight * .45,
                          child: Text(
                            nameProduct,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Oswald"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .03,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: wight * .42,
                          height: hight * .32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 4),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .05,
                      right: wight * .0220,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: hight * .28,
                          width: wight * .37,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(mainimage),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: hight * .270,
                      left: wight * .150,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: hight * .25,
                          width: wight * .35,
                          child: Text(
                            "$price.EGP",
                            style: TextStyle(
                                color: Colors.orange[900],
                                fontSize: 16,
                                fontFamily: "Oswald"),
                          ),
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
