import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobility/models/gamer.dart';
import 'package:mobility/screens/gamer/componets/silver_gamer_appbar.dart';
import 'package:mobility/screens/product/componets/continer_of_product.dart';
import 'package:mobility/screens/setting/setting_screen.dart';

class GamerProductScreen extends StatelessWidget {
  final String? logo;
  final Gamer? gamer;
  const GamerProductScreen({this.logo, this.gamer});
  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SilverGamerAppBar(
              name: gamer!.name,
              imageproduct: gamer!.mainImages,
              category: gamer!.category,
              logo: logo,
              id: gamer!.id,
            ),
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
                child: SingleChildScrollView(
                  child: Column(
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
                                              color: Theme.of(context)
                                                  .dividerColor,
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
                                          ? Image.network(gamer!.topScreen!)
                                          : Image.network(
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
                        text1: gamer!.screen,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/cpu.svg',
                        name: 'Cpu:',
                        text1: gamer!.cpu,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/Ram.svg',
                        name: 'Ram:',
                        text1: gamer!.ram,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/battery.svg',
                        name: 'Battery:',
                        text1: gamer!.capstiybattery,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/gpu.svg',
                        name: 'Gpu:',
                        text1: gamer!.gpu,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/frontcamera.svg',
                        name: 'Front Camera:',
                        text1: gamer!.frontcamera,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/backcamera.svg',
                        name: 'Rear Camera:',
                        text1: gamer!.rearcamera,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/memory.svg',
                        name: 'Memory',
                        text1: gamer!.space,
                      ),
                      Containerofproduct(
                        picture: 'assets/images/system.svg',
                        name: 'System:',
                        text1: gamer!.os,
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
                                      child: SizedBox(
                                        child: Text(
                                          'Sound:',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).dividerColor,
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
                                    gamer!.audio!,
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
                        text1: gamer!.more,
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
                                      child: Text(
                                        'Antutu:',
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
                                    gamer!.antutu!,
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
                                        'Res : ${gamer!.respubg}',
                                        style: TextStyle(
                                          fontFamily: 'Oswald',
                                          color: Theme.of(context).dividerColor,
                                        ),
                                      ),
                                      Text(
                                        'FBS : ${gamer!.fbspubg}',
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
                                        'Res : ${gamer!.rescod}',
                                        style: TextStyle(
                                          fontFamily: 'Oswald',
                                          color: Theme.of(context).dividerColor,
                                        ),
                                      ),
                                      Text(
                                        'FBS : ${gamer!.fbscod}',
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
                        text1: '${gamer!.price ?? gamer!.price}E.G.P',
                      ),
                      SizedBox(
                        height: hight * .080,
                        child: const Text(''),
                      ),
                    ],
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
