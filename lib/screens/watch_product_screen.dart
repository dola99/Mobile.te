import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobility/widget/Container_of_watchproduct.dart';

class ProductWatchDetailScreen extends StatelessWidget {
  final String nameProduct;
  final String logo;
  final String mainImage;
  final String blutooth;
  final String os;
  final String size;
  final String screenType;
  final String batterycapacity;
  final String alwayswork;
  final String colors;
  final String comatabilty;
  final String dimensios;
  final String memory;
  final String price;
  final String protatype;
  final String type;
  final String warrenty;
  final String waterproof;
  final String battery;
  final List images;
  ProductWatchDetailScreen(
      {this.nameProduct,
      this.logo,
      this.mainImage,
      this.blutooth,
      this.os,
      this.size,
      this.screenType,
      this.batterycapacity,
      this.alwayswork,
      this.battery,
      this.colors,
      this.comatabilty,
      this.dimensios,
      this.images,
      this.memory,
      this.price,
      this.protatype,
      this.type,
      this.warrenty,
      this.waterproof});
  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final wigh = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(nameProduct),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: high * .43,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: wigh * .6,
                          height: high * .1,
                          child: Image.network(
                            logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                          width: wigh * .6,
                          height: high * .29,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: Image.network(mainImage))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: high * .99,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      ContainerOfWatchPrduct(
                        name: 'Blutooth',
                        text: blutooth,
                        widget: Icon(
                          Icons.bluetooth,
                          color: Theme.of(context).cursorColor,
                        ),
                      ),
                      ContainerOfWatchPrduct(
                        name: 'System',
                        text: os,
                        widget: SvgPicture.asset('assets/images/system.svg'),
                      ),
                      ContainerOfWatchPrduct(
                        name: 'screen',
                        text: size,
                        widget:
                            SvgPicture.asset('assets/images/watchscreen.svg'),
                      ),
                      ContainerOfWatchPrduct(
                        name: 'screen Type',
                        text: screenType,
                        widget: SvgPicture.asset('assets/images/screen.svg'),
                      ),
                      ContainerOfWatchPrduct(
                        name: 'Battery Capacity',
                        text: batterycapacity,
                        widget: SvgPicture.asset('assets/images/battery.svg'),
                      ),
                      ContainerOfWatchPrduct(
                          name: 'NFC',
                          text: comatabilty,
                          widget: Icon(
                            Icons.nfc,
                            color: Theme.of(context).cursorColor,
                          )),
                      ContainerOfWatchPrduct(
                        name: 'Memory',
                        text: memory,
                        widget: SvgPicture.asset('assets/images/memory.svg'),
                      ),
                      ContainerOfWatchPrduct(
                        name: 'Still Working',
                        text: alwayswork,
                        widget: Icon(
                          Icons.workspaces_filled,
                          color: Theme.of(context).cursorColor,
                        ),
                      ),
                      ContainerOfWatchPrduct(
                        name: 'Price',
                        text: price,
                        widget: SvgPicture.asset('assets/images/price.svg'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
