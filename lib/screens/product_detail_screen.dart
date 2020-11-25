import 'package:flutter/material.dart';
import 'package:mobility/widget/Continer_of_product.dart';
import '../widget/custom_silver_delgte.dart';

class ProductDetailScreen extends StatefulWidget {
  final String logo;
  final String namrcompany;
  final String nameProduct;
  final String price;
  final String mainimage;
  final String screendetails;
  final String ram;
  final String cpu;
  final String battery;
  final String topimges;
  final String gpu;
  final String rearcamera;
  final String os;
  final String frontcamera;
  final String memory;
  final List<String> allimages;
  ProductDetailScreen(
      {this.logo,
      this.namrcompany,
      this.gpu,
      this.rearcamera,
      this.frontcamera,
      this.os,
      this.memory,
      this.nameProduct,
      this.price,
      this.battery,
      this.mainimage,
      this.allimages,
      this.screendetails,
      this.cpu,
      this.topimges,
      this.ram});
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                  expandedHeight: hight * .270,
                  brandimage: widget.logo,
                  namrcompany: widget.namrcompany,
                  nameProduct: widget.nameProduct,
                  mainimage: widget.mainimage,
                  price: widget.price),
            ),
            SliverFillRemaining(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: wight * .95,
                              height: hight * .13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).dividerColor),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: Container(
                                      width: wight * .240,
                                      height: hight * .0950,
                                      child: Column(
                                        children: [
                                          Container(
                                              height: hight * .070,
                                              width: wight * .08,
                                              child: Icon(
                                                Icons.add_to_home_screen,
                                                size: 30,
                                                color: Theme.of(context)
                                                    .cursorColor,
                                              )),
                                          Center(
                                            child: Container(
                                              child: Text(
                                                'Top Screen:',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontFamily: 'Oswald',
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, top: 8, left: 9),
                                    child: Container(
                                      width: wight * .65,
                                      height: hight * .0730,
                                      child: Center(
                                        child: Text(
                                          'text1',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontFamily: "Oswald",
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Containerofproduct(
                          number: 1,
                          name: 'Screen:',
                          picture: 'assets/images/screen.svg',
                          text1: widget.screendetails,
                        ),
                        Containerofproduct(
                          number: 1.5,
                          picture: 'assets/images/cpu.svg',
                          name: 'Cpu:',
                          text1: widget.cpu,
                        ),
                        Containerofproduct(
                          number: 2,
                          picture: 'assets/images/Ram.svg',
                          name: 'Ram:',
                          text1: widget.ram,
                        ),
                        Containerofproduct(
                          number: 2.5,
                          picture: 'assets/images/battery.svg',
                          name: 'Battery:',
                          text1: widget.battery,
                        ),
                        Containerofproduct(
                          number: 3,
                          picture: 'assets/images/gpu.svg',
                          name: 'Gpu:',
                          text1: widget.gpu,
                        ),
                        Containerofproduct(
                          number: 3.5,
                          picture: 'assets/images/frontcamera.svg',
                          name: 'Front Camera:',
                          text1: widget.frontcamera,
                        ),
                        Containerofproduct(
                          number: 4,
                          picture: 'assets/images/backcamera.svg',
                          name: 'Rear Camera:',
                          text1: widget.rearcamera,
                        ),
                        Containerofproduct(
                          number: 4.5,
                          picture: 'assets/images/memory.svg',
                          name: 'Memory',
                          text1: widget.memory,
                        ),
                        Containerofproduct(
                          number: 5,
                          picture: 'assets/images/system.svg',
                          name: 'System:',
                          text1: widget.os,
                        ),
                        Containerofproduct(
                          number: 5.5,
                          picture: 'assets/images/price.svg',
                          name: 'Price:',
                          text1: '${widget.price}E.G.P',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
