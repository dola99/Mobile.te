import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobility/models/gamer.dart';
import 'package:mobility/models/product.dart';
import 'package:mobility/screens/product/componets/continer_of_product.dart';
import 'package:mobility/screens/product/componets/custom_silver_delgte.dart';
import 'package:mobility/screens/setting/setting_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product? product;
  final String? logo;
  final Gamer? gamer;
  const ProductDetailScreen({this.product, this.logo, this.gamer});
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
                expandedHeight: hight * .29,
                brandimage: logo,
                nameProduct: product!.name,
                namrcompany: product!.category,
                mainimage: product!.mainImages,
                price: product!.price,
              ),
            ),
            /*  SilverAppBar(
            name: product.name,
            imageproduct: product.mainImages,
            category: product.category,
            logo: logo,
            id: product.id,
          ),*/
            SliverFillRemaining(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: wight * .95,
                          height: hight * .13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: SizedBox(
                                  width: wight * .240,
                                  height: hight * .0950,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: hight * .070,
                                        width: wight * .08,
                                        child: Icon(
                                          Icons.add_to_home_screen,
                                          size: 30,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Top Screen:',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).dividerColor,
                                            fontFamily: 'Oswald',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: Theme.of(context).dividerColor,
                                indent: hight * .025,
                                endIndent: hight * .025,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 2,
                                  top: 8,
                                  left: 9,
                                ),
                                child: SizedBox(
                                  width: wight * .61,
                                  height: hight * .0730,
                                  child: Center(
                                    child: SettingScreen.darktheme
                                        ? Image.network(
                                            product!.topScreen ??
                                                gamer!.topScreen!,
                                          )
                                        : Image.network(
                                            product!.lightTopScreen ??
                                                gamer!.lighttopscreen!,
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
                      name: 'Screen:',
                      picture: 'assets/images/screen.svg',
                      text1: product!.screen ?? gamer!.screen,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/cpu.svg',
                      name: 'Cpu:',
                      text1: product!.cpu ?? gamer!.cpu,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/Ram.svg',
                      name: 'Ram:',
                      text1: product!.ram ?? gamer!.ram,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/battery.svg',
                      name: 'Battery:',
                      text1: product!.capstiybattery ?? gamer!.capstiybattery,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/gpu.svg',
                      name: 'Gpu:',
                      text1: product!.gpu ?? gamer!.gpu,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/frontcamera.svg',
                      name: 'Front Camera:',
                      text1: product!.frontcamera ?? gamer!.frontcamera,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/backcamera.svg',
                      name: 'Rear Camera:',
                      text1: product!.rearcamera ?? gamer!.rearcamera,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/memory.svg',
                      name: 'Memory',
                      text1: product!.space ?? gamer!.space,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/system.svg',
                      name: 'System:',
                      text1: product!.os ?? gamer!.os,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: wight * .95,
                      height: hight * .13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: SizedBox(
                              width: wight * .240,
                              height: hight * .0950,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: hight * .070,
                                    width: wight * .08,
                                    child: Icon(
                                      Icons.volume_up,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Sound:',
                                      style: TextStyle(
                                        color: Theme.of(context).dividerColor,
                                        fontFamily: 'Oswald',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).dividerColor,
                            indent: hight * .025,
                            endIndent: hight * .025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 2,
                              top: 8,
                              left: 9,
                            ),
                            child: SizedBox(
                              width: wight * .61,
                              height: hight * .0730,
                              child: Center(
                                child: Text(
                                  product!.aduio ?? gamer!.audio!,
                                  style: TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Containerofproduct(
                      picture: 'assets/images/more.svg',
                      name: 'More:',
                      text1: product!.more ?? gamer!.more,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: wight * .95,
                      height: hight * .13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: SizedBox(
                              width: wight * .240,
                              height: hight * .0950,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: hight * .070,
                                    width: wight * .08,
                                    child: Image.asset(
                                      'assets/images/antutu.png',
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      child: Text(
                                        'Antutu:',
                                        style: TextStyle(
                                          color: Theme.of(context).dividerColor,
                                          fontFamily: 'Oswald',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).dividerColor,
                            indent: hight * .025,
                            endIndent: hight * .025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 2,
                              top: 8,
                              left: 9,
                            ),
                            child: SizedBox(
                              width: wight * .61,
                              height: hight * .0730,
                              child: Center(
                                child: Text(
                                  product!.antutue ?? gamer!.antutu!,
                                  style: TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: wight * .95,
                      height: hight * .13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: SizedBox(
                              width: wight * .240,
                              height: hight * .0950,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: hight * .070,
                                    width: wight * .08,
                                    child: SvgPicture.asset(
                                      'assets/images/pubg.svg',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Pubg:',
                                      style: TextStyle(
                                        color: Theme.of(context).dividerColor,
                                        fontFamily: 'Oswald',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).dividerColor,
                            indent: hight * .025,
                            endIndent: hight * .025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 2,
                              top: 8,
                              left: 9,
                            ),
                            child: SizedBox(
                              width: wight * .61,
                              height: hight * .0730,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Res : ${(product!.respubg) ?? (gamer!.respubg)}',
                                      style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    Text(
                                      'FBS : ${product!.fbspubg ?? gamer!.fbspubg}',
                                      style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: wight * .95,
                      height: hight * .13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: SizedBox(
                              width: wight * .240,
                              height: hight * .0950,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: hight * .070,
                                    width: wight * .12,
                                    child: SvgPicture.asset(
                                      'assets/images/callofduty.svg',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Call Of Duty:',
                                      style: TextStyle(
                                        color: Theme.of(context).dividerColor,
                                        fontFamily: 'Oswald',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).dividerColor,
                            indent: hight * .025,
                            endIndent: hight * .025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 2,
                              top: 8,
                              left: 9,
                            ),
                            child: SizedBox(
                              width: wight * .61,
                              height: hight * .0730,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Res : ${product!.rescod ?? gamer!.rescod}',
                                      style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    Text(
                                      'FBS : ${product!.fbscod ?? gamer!.fbscod}',
                                      style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Containerofproduct(
                      picture: 'assets/images/price.svg',
                      name: 'Price:',
                      text1: '${product!.price ?? gamer!.price}E.G.P',
                    ),
                    SizedBox(
                      height: hight * .080,
                      child: const Text(''),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
