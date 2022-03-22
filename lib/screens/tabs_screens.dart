import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobility/screens/compare/compare_screen.dart';
import 'package:mobility/screens/home/home_screen.dart';
import 'package:mobility/screens/offline_screen.dart';
import 'package:mobility/screens/setting/setting_screen.dart';

class TabsScreens extends StatefulWidget {
  static const roouteName = "/tabs-screen";
  static int indexpage = 0;
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  final _isoffline = false;

  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': HomePage(), 'title': 'Home'},
      {'page': CompareScreen(), 'title': 'Compare'},
      {'page': SettingScreen(), 'title': 'Menu'},
    ];
    super.initState();
  }

  int _selectedpageIndex = TabsScreens.indexpage;

  void _selectPage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _isoffline
          ? OfflineScreen()
          : _pages[_selectedpageIndex]['page'] as Widget?,
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 26,
        onTap: _selectPage,
        unSelectedColor: Theme.of(context).buttonColor,
        strokeColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).primaryColor,
        selectedColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedpageIndex,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home),
            /*  title: Text(
              'Home',
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontFamily: "Oswald",
                  fontSize: 10),
            ),*/
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.compare),
            /* title: Text(
              'Compare',
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontFamily: "Oswald",
                  fontSize: 10),
            ),*/
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.settings),
            /*title: Text(
              'Setting',
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontFamily: "Oswald",
                  fontSize: 10),
            ),*/
          ),
        ],
      ),
    );
  }
}
