import 'package:flutter/material.dart';
import '../widget/custom_silver_delgte.dart';

class ProductDetailScreen extends StatefulWidget {
  final String logo;
  final String namrcompany;
  final String nameProduct;
  final String price;
  final String mainimage;
  final String screendetails;
  final String cpu;
  final List<String> allimages;
  ProductDetailScreen({
    this.logo,
    this.namrcompany,
    this.nameProduct,
    this.price,
    this.mainimage,
    this.allimages,
    this.screendetails,
    this.cpu,
  });
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                  expandedHeight: hight * .230,
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
                child: Text("hi"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
